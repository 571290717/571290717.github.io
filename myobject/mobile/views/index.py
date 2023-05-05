from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from datetime import datetime
# Create your views here.
from myadmin.models import Member,Shop,Category,Product
from myadmin.models import Orders,OrderDetail,Payment

def index(request):
    ''' 移动端首页 '''
    #获取并判断当前店铺信息
    shopinfo = request.session.get("shopinfo",None)
    if shopinfo is None:
        return redirect(reverse("mobile_shop")) #重定向到店铺选择页
    #获取当前店铺下的菜品类别和菜品信息
    clist = Category.objects.filter(shop_id=shopinfo['id'],status=1)
    productlist = dict()
    for vo in clist:
        plist = Product.objects.filter(category_id=vo.id,status=1)
        productlist[vo.id] = plist
    context = {'categorylist':clist,'productlist':productlist.items(),'cid':clist[0]}
    return render(request,"mobile/index.html",context)

def register(request):
    ''' 移动端会员注册/登录表单 '''
    return render(request,"mobile/register.html")

def doRegister(request):
    ''' 执行会员注册/登录 '''
    #模拟短信验证
    verifycode = "1234" #reuqest.session['verifycode']
    if verifycode != request.POST['code']:
        context = {"info":'短信验证码错误'}
        return render(request,"mobile/register.html",context)

    try:
        #根据手机号码获取当前会员信息
        member = Member.objects.get(mobile=request.POST['mobile'])
    except Exception as err:
        #print(err)
        #此处可以执行当前会员注册（添加）
        ob = Member()
        ob.nickname = "顾客" #默认会员名称
        ob.avatar = "moren.png" #默认头像
        ob.mobile = request.POST['mobile'] #手机号码
        ob.status = 1
        ob.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        ob.save()
        member = ob
    #检验当前会员状态
    if member.status == 1:
        #将当前会员信息转成字典格式并存放到session中
        request.session['mobileuser'] = member.toDict()
        #重定向到登录页
        return redirect(reverse("mobile_index")) 
    else:
        context = {"info":'此账户信息禁用！'}
        return render(request,"mobile/register.html",context)


def shop(request):
    ''' 移动端选择店铺页面 '''
    context = {"shoplist":Shop.objects.filter(status=1)}
    return render(request,"mobile/shop.html",context)

def selectShop(request):
    ''' 执行移动端店铺选择操作 '''
    #获取选择的店铺信息，并放置到session中
    sid = request.GET['sid']
    ob = Shop.objects.get(id=sid)
    request.session['shopinfo'] = ob.toDict()
    request.session['cartlist'] = {} #清空购物车
    #跳转到首页
    return redirect(reverse("mobile_index"))

def addOrders(request):
    ''' 移动端下单表单页'''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    total_money = 0 #初始化一个总金额
    #遍历购物车中的菜品并累加总金额
    for vo in cartlist.values():
        total_money += vo['num']*vo['price']
    request.session['total_money'] = total_money #放进session
    return render(request,"mobile/addOrders.html")

def doAddOrders(request):
    ''' 执行订单添加操作 '''
    try:
        #执行订单信息的添加
        od = Orders()
        od.shop_id = request.session['shopinfo']['id']
        od.member_id = request.session['mobileuser']['id']
        od.user_id = 0
        od.money = request.session['total_money']
        od.status = 1 #订单状态:1过行中/2无效/3已完成
        od.payment_status = 2 #支付状态:1未支付/2已支付/3已退款
        od.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        od.save()

        #执行支付信息添加
        op = Payment()
        op.order_id = od.id #订单id号
        op.member_id = request.session['mobileuser']['id']
        op.type = 2
        op.bank = request.GET.get("bank",3) #收款银行渠道:1微信/2余额/3现金/4支付宝
        op.money = request.session['total_money']
        op.status = 2 #支付状态:1未支付/2已支付/3已退款
        op.create_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.update_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        op.save()

        #执行订单详情的添加
        cartlist = request.session.get("cartlist",{}) #获取购物车中的菜品信息
        #遍历购物车中的菜品并添加到订单详情中
        for item in cartlist.values():
            ov = OrderDetail()
            ov.order_id = od.id  #订单id
            ov.product_id = item['id']  #菜品id
            ov.product_name = item['name'] #菜品名称
            ov.price = item['price']     #单价
            ov.quantity = item['num']  #数量
            ov.status = 1 #状态:1正常/9删除
            ov.save()

        del request.session["cartlist"]
        del request.session['total_money']
    except Exception as err:
        print(err)
    return render(request,"mobile/orderinfo.html",{"order":od})