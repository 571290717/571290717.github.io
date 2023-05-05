//获取顶部高度

$(document).ready(function(){
	// 头部获取高度
	$(".main-container,#sortNav,#listNav,#Introheader,#commheader").css("margin-top",$("header").height());
	
	//选择配送点判断字数变大
	var objLength = $("#head-delivery").text().length;
	if(objLength == 5){
		$("#head-delivery").css({"font-size":".5rem"});
	}
	
	// Home Search Start
	$(document).ready(function(){
	  $("#search-input").focus(function(){
	  	$("#search-box").css({"left":".25rem","right":"6.1rem"});
	    $("#search-box .icon-sousuo").css({"left":".15rem"});
	    $("#search-input").css({"padding-left":"1.9rem"});
	    $("menu").css({"display":"none"});
			
			if ($("#search-input").val()==""){
				$("#search-cancel").show();
				$("#search-submit").hide();
			}else{
				$("#search-cancel").hide();
				$("#search-submit").show();
			}
	
	    $("#search h1").hide();
	    $("#search-content").show();
	    $("#search-input").bind("propertychange input",function(){
	
				if ($("#search-input").val()==""){
					$("#search-cancel").show();
					//$("#search-cancel").show();
					$("#search-submit").hide();
				}else{
					$("#search-cancel").hide();
					$("#search-submit").show();
				}
				
	    })
	    
	  });
	  $("#search-cancel").bind('touchstart',function(){
	  	$(this).css("background","rgba(0,0,0,.1)")
	  })
	  
	  $("#search-cancel").click(function(){
	  	$("#search-box").removeAttr("style");
	    $("#search-box .icon-sousuo").removeAttr("style");
	    $("#search-input").val("").removeAttr("style");
	    $("#search-cancel").hide().removeAttr("style");
	    $("#search h1").fadeIn();
	    $("#search-content").hide();
	    $("menu").show();
	  });
	
	});
	// Home Search end

	//弹出层 start  // 点击、显示内容、内容列表、关闭
	function PopUplayer(objClick,showCon,Conlist,objClose){

		$(objClick).bind('click',function(){
			var ConlistHeight = $(Conlist).height();
			var showConHeight = $(showCon).height();
			var showConWidth = $(showCon).width();
			
	    if($(showCon).is(":hidden")){
				$(showCon).show();
				$("html,body").css({"overflow":"hidden","width":"100%","height":"100%"});
				$(Conlist).removeAttr("style");
				$(objClose).removeAttr("style");
				$(Conlist).removeClass("fadeOutBottom100");
				
				if(showCon == "#DeliveryContent"){
					$(Conlist).css("height",showConHeight);
				}
				if(showCon == "#DetailContent"){
					$(Conlist).css("width",showConWidth);
				}
				if(showCon == "#orderPay"){
					var orderPayHeight = $(Conlist).height() / 2
					$(Conlist).css({"height":$(Conlist).height(),"margin-top":-orderPayHeight});
					$(Conlist).removeClass("fadeInBottom20");
				}


			}else{
				$(showCon).fadeOut(900);
				$("html,body").removeAttr("style");
				

				if(showCon != "#DetailContent"){
					//$(Conlist).animate({"bottom":-ConlistHeight},300);
					$(Conlist).addClass("fadeOutBottom100");
				}
				if(showCon == "#DeliveryContent"){
					$(Conlist).css("height",showConHeight);
				}
			}
	  })
		$(objClose).bind('touchstart',function(){
			$(showCon).fadeOut(900);
			$("html,body").removeAttr("style");
			

			var ConlistHeight = $(Conlist).height();
			var ConlistWidth = $(Conlist).width();
			
			if(showCon == "#DetailContent"){
				$(Conlist).animate({"right":-ConlistWidth},300);
				$("#DetailContent samp").fadeOut(500);
			}else if(showCon == "#orderPay"){
				$(Conlist).addClass("fadeInBottom20");
			}else{
				//$(Conlist).animate({"bottom":-ConlistHeight},300);
				$(Conlist).addClass("fadeOutBottom100");
			}

		});
	}

	PopUplayer("#order-cart","#cartContent",".cartContent","#cartContent .close")  // 购物车
	PopUplayer("#list-content a","#DetailContent",".DetailContent","#DetailContent .button")  // 产品详情
	PopUplayer("#Delivery-select","#DeliveryContent",".DeliveryContent","#DeliveryContent .close")  // 配送点
	PopUplayer("#DeliveryContent li","#DeliverysContent",".DeliverysContent","#DeliverysContent .close")  // 配送点说明
	PopUplayer("#order-add-address,#order-Edit-address","#order-add-address-Content",".order-add-address-Content","#order-add-address-Content .close")  // 添加地址
	PopUplayer("#Edit-Address","#Edit-Address-Content",".Edit-Address-Content","#Edit-Address-Content .close")  // 管理地址
	PopUplayer("#orderSubmit","#orderPay",".orderPay","#orderPay .close")  // 订单支付
	//弹出层 End


	//商品介绍选项卡 start
	function tabs(tabMenu,tabCon)
	{
		var $menu = $(tabMenu);
		$menu.bind('touchstart',function(){
			$(this).addClass('select').siblings().removeClass('select');
			var index = $menu.index(this);
			$(tabCon).eq(index).show().siblings().hide();
			commlist();
		});
		
	}
	tabs("#IntroContent > #Introheader a","#Introlist > .tabWrap");
	tabs("#commContent > #commheader a","#commlist > .tabWrap");
	//商品介绍选项卡 End
	
	//商品详情评论点击显示全部 start
	commlist();
	function commlist(){
		$("#D-comment .D-comment-content,#commlist .D-comment .D-comment-content").each(function(){
			var lineHeight = $(this).css('line-height').replace("px","");
			var height = $(this).height();
			var that = this;
		
			if(height / lineHeight > 2){
				$(this).addClass('D-comment-Default');
				$(this).find('i').show();
				$(this).find('i').bind('click',function(){
					if($(that).hasClass('D-comment-Default')){
						$(this).removeClass('icon-arrownext')
						$(this).addClass('icon-arrowlast')
						$(that).removeClass('D-comment-Default')
						$(that).addClass('D-comment-Open')
					}else{
						$(this).removeClass('icon-arrowlast')
						$(this).addClass('icon-arrownext')
						$(that).removeClass('D-comment-Open')
						$(that).addClass('D-comment-Default')
					}
				});
			}
			
		})
	}
	//商品详情评论点击显示全部 End
	
	
	//实时获取浏览器宽度将字体大小赋值给html，实现在不同终端显示zoom效果
	/*(function (doc, win) {
	  var docEl = doc.documentElement,
	    resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
	    recalc = function () {
	      var clientWidth = docEl.clientWidth;
	      if (!clientWidth) return;
	      docEl.style.fontSize = 12 * (clientWidth / 320) + 'px';
	      $(".content").css("top",$("header").height());
	      $("#search-content").css("top",$("header").height());
	    };
	
	  if (!doc.addEventListener) return;
	  win.addEventListener(resizeEvt, recalc, false);
	  doc.addEventListener('DOMContentLoaded', recalc, false);
	})(document, window);*/

});

