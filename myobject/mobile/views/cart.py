#购物车信息管理视图文件
from django.shortcuts import render
from django.http import HttpResponse,JsonResponse
from django.shortcuts import redirect
from django.urls import reverse

from myadmin.models import Product

def add(request):
    ''' 添加购物车操作 '''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    #获取要购买的菜品信息，
    pid = request.GET.get("pid",None)
    if pid is not None:
        product = Product.objects.get(id=pid).toDict()
        product['num'] = 1 #初始化当前菜品的购买量
        #判断当前购物车中是否存在要放进购物车的菜品
        if pid in cartlist:
            cartlist[pid]['num'] += product['num'] #增加购买量
        else:
            cartlist[pid] = product #放进购物车
        #将cartlist购物车信息放入到session中
        request.session['cartlist'] = cartlist
    #print(cartlist)
    #响应json格式的购物车数据
    return JsonResponse({'cartlist':cartlist})

def delete(request):
    ''' 删除购物车中商品操作 '''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    del cartlist[pid]
    #将cartlist购物车信息放入到session中
    request.session['cartlist'] = cartlist
    #响应json格式的购物车数据
    return JsonResponse({'cartlist':cartlist})

def clear(request):
    ''' 清空购物车操作 '''
    request.session['cartlist'] = {}
    #响应json格式的购物车数据
    return JsonResponse({'cartlist':{}})

def change(request):
    ''' 更改购物车信息操作 '''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    pid = request.GET.get("pid",0) #获取要修改的菜品id
    m = int(request.GET.get('num',1)) #要修改的数量
    if m < 1:
        m = 1
    cartlist[pid]['num'] = m #修改购物中的数量
    #将cartlist购物车信息放入到session中
    request.session['cartlist'] = cartlist
    #响应json格式的购物车数据
    return JsonResponse({'cartlist':cartlist})