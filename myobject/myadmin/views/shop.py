#店铺信息管理的视图文件
from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator
from django.db.models import Q
from datetime import datetime
import time
# Create your views here.
from myadmin.models import Shop

def index(request,pIndex=1):
    '''浏览信息'''
    smod = Shop.objects
    slist = smod.filter(status__lt=9)
    mywhere=[]
    #获取并判断搜索条件
    kw = request.GET.get("keyword",None)
    if kw:
        slist = slist.filter(name__contains=kw)
        mywhere.append('keyword='+kw)
     # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status','')
    if status != '':
        slist = slist.filter(status=status)
        mywhere.append("status="+status)
        
    slist = slist.order_by("id")#对id排序
    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(slist,5) #以每页5条数据分页
    maxpages = page.num_pages #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #获取当前页数据
    plist = page.page_range #获取页码列表信息
    context = {"shoplist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/shop/index.html",context)

def add(request):
    '''加载信息添加表单'''
    return render(request,"myadmin/shop/add.html")

def insert(request):
    '''执行信息添加'''
    try:
        # 店铺封面图片的上传处理
        myfile = request.FILES.get("cover_pic",None)
        if not myfile:
            return HttpResponse("没有店铺封面上传文件信息")
        cover_pic = str(time.time())+"."+myfile.name.split('.').pop()
        destination = open("./static/uploads/shop/"+cover_pic,"wb+")
        for chunk in myfile.chunks():      # 分块写入文件  
            destination.write(chunk)  
        destination.close()

        # 店铺logo图片的上传处理
        myfile = request.FILES.get("banner_pic",None)
        if not myfile:
            return HttpResponse("没有店铺logo上传文件信息")
        banner_pic = str(time.time())+"."+myfile.name.split('.').pop()
        destination = open("./static/uploads/shop/"+banner_pic,"wb+")
        for chunk in myfile.chunks():      # 分块写入文件  
            destination.write(chunk)  
        destination.close()

        #实例化model，封装信息，并执行添加操作
        ob = Shop()
        ob.name = request.POST['name']
        ob.address = request.POST['address']
        ob.phone = request.POST['phone']
        ob.cover_pic = cover_pic
        ob.banner_pic = banner_pic
        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context = {'info':"添加成功！"}
    except Exception as err:
        print(err)
        context = {'info':"添加失败！"}
    return render(request,"myadmin/info.html",context)

def delete(request,sid=0):
    '''执行信息删除'''
    try:
        ob = Shop.objects.get(id=sid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"myadmin/info.html",context)

def edit(request,sid=0):
    '''加载信息编辑表单'''
    try:
        ob = Shop.objects.get(id=sid)
        context = {'shop':ob}
        return render(request,"myadmin/shop/edit.html",context)
    except Exception as err:
        print(err)
        context = {'info':"没有找到要修改的信息！"}
        return render(request,"myadmin/info.html",context)

def update(request,sid):
    '''执行信息编辑'''
    try:
        ob = Shop.objects.get(id=sid)
        ob.name = request.POST['name']
        ob.address = request.POST['address']
        ob.phone = request.POST['phone']
        ob.status = request.POST['status']
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context = {'info':"修改成功！"}
    except Exception as err:
        print(err)
        context = {'info':"修改失败！"}
    return render(request,"myadmin/info.html",context)