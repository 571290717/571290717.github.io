#会员信息管理的视图文件
from django.shortcuts import render
from django.http import HttpResponse
from django.core.paginator import Paginator
from datetime import datetime
# Create your views here.
from myadmin.models import Member

def index(request,pIndex=1):
    '''浏览信息'''
    umod = Member.objects
    ulist = umod.filter(status__lt=9)
    mywhere=[]
    #判断并处理状态搜索条件
    status = request.GET.get('status','')
    if status != '':
        ulist = ulist.filter(status=status)
        mywhere.append("status="+status)
        
    ulist = ulist.order_by("id")#对id排序
    #执行分页处理
    pIndex = int(pIndex)
    page = Paginator(ulist,5) #以每页5条数据分页
    maxpages = page.num_pages #获取最大页数
    #判断当前页是否越界
    if pIndex > maxpages:
        pIndex = maxpages
    if pIndex < 1:
        pIndex = 1
    list2 = page.page(pIndex) #获取当前页数据
    plist = page.page_range #获取页码列表信息
    context = {"memberlist":list2,'plist':plist,'pIndex':pIndex,'maxpages':maxpages,'mywhere':mywhere}
    return render(request,"myadmin/member/index.html",context)

def delete(request,uid=0):
    '''执行信息删除'''
    try:
        ob = Member.objects.get(id=uid)
        ob.status = 9
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        context = {'info':"删除成功！"}
    except Exception as err:
        print(err)
        context = {'info':"删除失败！"}
    return render(request,"myadmin/info.html",context)
