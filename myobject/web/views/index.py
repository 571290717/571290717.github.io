from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
# Create your views here.
from myadmin.models import User,Shop,Category,Product

def index(request):
    ''' 项目前台大堂点餐首页 '''
    return redirect(reverse("web_index"))

def webindex(request):
    ''' 项目前台大堂点餐首页 '''
    #尝试从session中获取名字为cartlist的购物车信息，若没有返回{}
    cartlist = request.session.get('cartlist',{})
    total_money = 0 #初始化一个总金额
    #遍历购物车中的菜品并累加总金额
    for vo in cartlist.values():
        total_money += vo['num']*vo['price']
    request.session['total_money'] = total_money #放进session
    #将session中的菜品和类别信息获取并items转换，可实现for in的遍历
    context = {'categorylist':request.session.get("categorylist",{}).items()}
    return render(request,"web/index.html",context)

def login(request):
    ''' 加载登陆表单页 '''
    shoplist = Shop.objects.filter(status=1)
    context = {'shoplist':shoplist}
    return render(request, "web/login.html",context)

def dologin(request):
    ''' 执行登陆操作 '''
    try:
        #执行是否选择店铺判断
        if request.POST['shop_id'] == '0':
            return redirect(reverse('web_login')+"?errinfo=1")

        #执行验证码的校验
        if request.POST['code'] != request.session['verifycode']:
            return redirect(reverse('web_login')+"?errinfo=2")
        
        #根据登录账号获取登录者信息
        user = User.objects.get(username=request.POST['username'])
        #判断当前用户是否正常或管理员
        if user.status == 6 or user.status == 1:
            #判断登录密码是否相同
            import hashlib
            md5 = hashlib.md5()
            s = request.POST['pass']+user.password_salt #从表单中获取密码并添加干扰值
            md5.update(s.encode('utf-8')) #将要产生md5的子串放进去
            if user.password_hash == md5.hexdigest(): #获取md5值
                print('登录成功')
                #将当前登录成功的用户信息以webuser为key写入到session中
                request.session['webuser'] = user.toDict()
                #获取当前店铺信息
                shopob = Shop.objects.get(id=request.POST['shop_id'])
                request.session['shopinfo'] = shopob.toDict()
                #获取当前店铺中所有的菜品类别和菜品信息
                clist = Category.objects.filter(shop_id = shopob.id,status=1)
                categorylist = dict() #菜品类别（内含有菜品信息）
                productlist = dict() #菜品信息
                #遍历菜品类别信息
                for vo in clist:
                    c = {'id':vo.id,'name':vo.name,'pids':[]}
                    plist = Product.objects.filter(category_id=vo.id,status=1)
                    #遍历当前类别下的所有菜品信息
                    for p in plist:
                        c['pids'].append(p.toDict())
                        productlist[p.id]=p.toDict()
                    categorylist[vo.id] = c   
                #将上面的结果存入到session中
                request.session['categorylist'] = categorylist
                request.session['productlist'] = productlist
                
                #重定向到前台大堂点餐首页
                return redirect(reverse("web_index"))
            else:
                return redirect(reverse('web_login')+"?errinfo=5")
        else:
            return redirect(reverse('web_login')+"?errinfo=4")
    except Exception as err:
        print(err)
        return redirect(reverse('web_login')+"?errinfo=3")

def logout(request):
    ''' 执行前台退出操作 '''
    del request.session['webuser']
    return redirect(reverse('web_login'))

def verify(request):
    '''生成验证码 '''
    #引入随机函数模块
    import random
    from PIL import Image, ImageDraw, ImageFont
    #定义变量，用于画面的背景色、宽、高
    #bgcolor = (random.randrange(20, 100), random.randrange(
    #    20, 100),100)
    bgcolor = (242,164,247)
    width = 100
    height = 25
    #创建画面对象
    im = Image.new('RGB', (width, height), bgcolor)
    #创建画笔对象
    draw = ImageDraw.Draw(im)
    #调用画笔的point()函数绘制噪点
    for i in range(0, 100):
        xy = (random.randrange(0, width), random.randrange(0, height))
        fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
        draw.point(xy, fill=fill)
    #定义验证码的备选值
    #str1 = 'ABCD123EFGHIJK456LMNOPQRS789TUVWXYZ0'
    str1 = '0123456789'
    #随机选取4个值作为验证码
    rand_str = ''
    for i in range(0, 4):
        rand_str += str1[random.randrange(0, len(str1))]
    #构造字体对象，ubuntu的字体路径为“/usr/share/fonts/truetype/freefont”
    font = ImageFont.truetype('static/arial.ttf', 21)
    #font = ImageFont.load_default().font
    #构造字体颜色
    fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    #绘制4个字
    draw.text((5, -3), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, -3), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -3), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, -3), rand_str[3], font=font, fill=fontcolor)
    #释放画笔
    del draw
    #存入session，用于做进一步验证
    request.session['verifycode'] = rand_str
    """
    python2的为
    # 内存文件操作
    import cStringIO
    buf = cStringIO.StringIO()
    """
    # 内存文件操作-->此方法为python3的
    import io
    buf = io.BytesIO()
    #将图片保存在内存中，文件类型为png
    im.save(buf, 'png')
    #将内存中的图片数据返回给客户端，MIME类型为图片png
    return HttpResponse(buf.getvalue(), 'image/png')