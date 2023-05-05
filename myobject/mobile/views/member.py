from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
# Create your views here.
from myadmin.models import Member,Shop,Orders,OrderDetail

def index(request):
    ''' 个人中心首页 '''
    return render(request,"mobile/member.html")

def orders(request):
    ''' 个人中心浏览订单 '''
    mod = Orders.objects
    mid = request.session['mobileuser']['id'] #获取当前会员id号
    olist = mod.filter(member_id=mid)
     # 获取、判断并封装状态status搜索条件
    status = request.GET.get('status','')
    if status != '':
        olist = olist.filter(status=status)
        
    list2 = olist.order_by("-id")#对id排序
 
    #遍历当前订单，封装订单详情信息
    orders_status = ['无','排队中','已撤销','已完成']
    for vo in list2:
        plist = OrderDetail.objects.filter(order_id=vo.id)[:4] #获取头4条
        vo.plist = plist
        vo.statusinfo = orders_status[vo.status]

    context = {"orderslist":list2}
    return render(request,"mobile/member_orders.html",context)

def detail(request):
    ''' 个人中心中的订单详情 '''
    pid = request.GET.get("pid",0)
    #获取当前订单
    order = Orders.objects.get(id=pid)
    #获取订单详情
    plist = OrderDetail.objects.filter(order_id=order.id)
    order.plist = plist
    #获取店铺名称
    shop = Shop.objects.only("name").get(id=order.shop_id)
    order.shopname = shop.name
    orders_status = ['无','排队中','已撤销','已完成']
    order.statusinfo = orders_status[order.status]

    return render(request,"mobile/member_detail.html",{"order":order})

def logout(request):
    ''' 执行会员退出 '''
    del request.session['mobileuser']
    return render(request,"mobile/register.html")