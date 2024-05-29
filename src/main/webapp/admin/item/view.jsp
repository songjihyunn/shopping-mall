<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="hat1.info.ProductM" %>
<%@ page import="hat1.info.ProductE" %>
<%@ page import="hat1.info.ProductS" %>
<script>

function cate_2(cate,cate2){
	$.ajax({
		url: "category_ok", //전송받을 페이지 경로
		type: "post", //데이터 읽어오는 방식
		dataType: "text", //데이터 방식
		data: "ca_id="+cate+"&ca_id2="+cate2, //데이터 변수 전달
		error:function(){ //실패일 경우
			alert("실패");
		},
		success:function(text){ //성공일 경우
			$("#category2_result").html(text);
		}
	});
}

cate_2(${item.category1},${item.category2}); //중분류 한번 실행

</script>
<form name="cart_insert" action="/admin/cart/CartWrite" method="post">
	<input type="hidden" name="it_uid" value="${item.it_uid }">
	<input type="hidden" name="it_price" value="${item.it_price }">
	<input type="hidden" name="it_name" value="${item.it_name }">
	<input type="hidden" name="mb_id" value="${item.mb_id }">
	<input type="hidden" name="it_sale" value="${item.it_sale }">
	<input type="hidden" name="it_point" value="${item.it_point }">
	<input type="hidden" name="it_option" value="${item.it_option }">
	<input type="hidden" name="file1" value="${item.file1 }">
	<input type="hidden" id="hidden_it_size" name="it_size" value="${selectedSize}">
	
	<div class="ProductDetail" style="width: 100%; height: 1052.42px; right:-400px; position: relative">
	  <div class="DivWFull" style="width: 615px; height: 672px; left: 0px; top: 0px; position: absolute">
	    <div class="Rectangle1" style="width: 1317px; height: 1065px; left: 0px; top: 0px; position: absolute; background: white"></div>
	    <div class="MediaGallery" style="width: 581px; height: 671px; left: 67px; top: 76px; position: absolute">
	      <div class="DivSwiperContainer" style="width: 491px; padding-bottom: 0.42px; left: 90px; top: 0px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	        <div class="ResponsiveImage" style="width: 491px; height: 654.58px; position: relative">
	          <img class="056fa07083a642798627Bbb11aace6e8Jpg" style="width: 491px; height: 654.58px; left: 0px; top: 0px; position: absolute" src="/upload_item/${item.file1}">
	        </div>
	      </div>
	      <div class="DivSfMediaNav" style="padding-right: 20px; left: 0px; top: 0px; position: absolute; justify-content: center; align-items: flex-start; display: inline-flex">
	        <div class="DivSwiperWrapper" style="padding-bottom: 526.64px; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 10px; display: inline-flex">
	          <!-- <div class="DivSwiperSlide" style="padding-bottom: 4.02px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	            <div class="DivSfProdMedia" style="padding: 6px; border: 1px white solid; justify-content: flex-start; align-items: flex-start; display: flex">
	              <div class="ResponsiveImage" style="width: 58px; height: 77.31px; position: relative">
	                <img class="HJpg" style="width: 58px; height: 77.31px; left: 0px; top: 0px; position: absolute" src="https://via.placeholder.com/58x77" />
	              </div>
	            </div>
	          </div> -->
	           <c:if test="${not empty item.file1}">
			  <div class="DivSwiperSlide" style="padding-bottom: 4.02px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
			    <div class="DivSfProdMedia" style="padding: 6px; border: 1px white solid; justify-content: flex-start; align-items: flex-start; display: flex">
			      <div class="ResponsiveImage" style="width: 58px; height: 77.31px; position: relative">
			        <img class="AEc779b58F23e478cB196685009bbe4c6Jpg" style="width: 58px; height: 77.31px; left: 0px; top: 0px; position: absolute" src="/upload_item/${item.file1}" />
			      </div>
			    </div>
			  </div>
			</c:if>
	          <c:if test="${not empty item.file2}">
			  <div class="DivSwiperSlide" style="padding-bottom: 4.02px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
			    <div class="DivSfProdMedia" style="padding: 6px; border: 1px white solid; justify-content: flex-start; align-items: flex-start; display: flex">
			      <div class="ResponsiveImage" style="width: 58px; height: 77.31px; position: relative">
			        <img class="AEc779b58F23e478cB196685009bbe4c6Jpg" style="width: 58px; height: 77.31px; left: 0px; top: 0px; position: absolute" src="/upload_item/${item.file2}" />
			      </div>
			    </div>
			  </div>
			</c:if>
			
			<c:if test="${not empty item.file3}">
			  <div class="DivSwiperSlide" style="padding-bottom: 4.02px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
			    <div class="DivSfProdMedia" style="padding: 6px; border: 1px white solid; justify-content: flex-start; align-items: flex-start; display: flex">
			      <div class="ResponsiveImage" style="width: 58px; height: 77.31px; position: relative">
			        <img class="B7e4a33fc59f44a6e88f8030c501ae8adJpg" style="width: 58px; height: 77.31px; left: 0px; top: 0px; position: absolute" src="/upload_item/${item.file3}" />
			      </div>
			    </div>
			  </div>
			</c:if>
			
			<c:if test="${not empty item.file4}">
			  <div class="DivSwiperSlide" style="padding-bottom: 4.02px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
			    <div class="DivSfProdMedia" style="padding: 6px; border: 1px white solid; justify-content: flex-start; align-items: flex-start; display: flex">
			      <div class="ResponsiveImage" style="width: 58px; height: 77.31px; position: relative">
			        <img class="CA4f661f6785743d888943ba193916223Jpg" style="width: 58px; height: 77.31px; left: 0px; top: 0px; position: absolute" src="/upload_item/${item.file4}" />
			      </div>
			    </div>
			  </div>
			</c:if>
	        </div>
	      </div>
	    </div>
	  </div>
	  <div class="Details" style="width: 615px; height: 1038.42px; left: 686px; top: 14px; position: absolute"></div>
	  <div class="Details" style="width: 585px; height: 1008.42px; left: 701px; top: 14px; position: absolute">
	    <div class="Fasco" style="left: 0px; top: 0px; position: absolute; color: #666666; font-size: 14px; font-family: Volkhov; font-weight: 400; text-transform: uppercase; line-height: 20px; word-wrap: break-word">${item.mb_id}</div>
	    <div class="Title" style="width: 585px; height: 44px; left: 0px; top: 25px; position: absolute">
	      <div class="Heading1DenimJacket" style="left: 0px; top: 1px; position: absolute; color: black; font-size: 30px; font-family: Volkhov; font-weight: 400; line-height: 42px; word-wrap: break-word">${item.it_name }</div>
	      <div class="Button" style="width: 45px; padding-top: 12px; padding-bottom: 13px; padding-left: 12.50px; padding-right: 12.50px; left: 540px; top: 0px; position: absolute; background: white; border-radius: 45px; border: 1px #EEEEEE solid; justify-content: center; align-items: center; display: inline-flex">
	        <div class="Svg" style="height: 20px; padding-left: 0.71px; padding-right: 0.71px; padding-top: 1.11px; padding-bottom: 1.11px; justify-content: flex-start; align-items: flex-start; display: flex">
	          <img class="Vector" src="/upload_item/star.png">
	        </div>
	      </div>
	    </div>
	    <div class="Ratings" style="width: 585px; height: 22.50px; left: 0px; top: 69px; position: absolute">
	      <div class="Img43OutOf5Stars" style="width: 75px; left: 0px; top: 3.75px; position: absolute; justify-content: center; align-items: flex-start; display: inline-flex">
	        <div class="Frame" style="height: 15px; padding-top: 0.28px; padding-bottom: 0.28px; justify-content: flex-start; align-items: flex-start; display: flex">
	        	<img class="Vector" src="/upload_item/star2.png"> 
	        </div>
	        <div class="Frame" style="height: 15px; padding-top: 0.28px; padding-bottom: 0.28px; justify-content: flex-start; align-items: flex-start; display: flex">
	          	<img class="Vector" src="/upload_item/star2.png">
	        </div>
	        <div class="Frame" style="height: 15px; padding-top: 0.28px; padding-bottom: 0.28px; justify-content: flex-start; align-items: flex-start; display: flex">
	         	<img class="Vector" src="/upload_item/star2.png">
	        </div>
	        <div class="Frame" style="height: 15px; padding-top: 0.28px; padding-bottom: 0.28px; justify-content: flex-start; align-items: flex-start; display: flex">
	          	<img class="Vector" src="/upload_item/star2.png">
	        </div>
	        <div class="Frame" style="height: 15px; padding-top: 0.28px; padding-bottom: 0.28px; justify-content: flex-start; align-items: flex-start; display: flex">
	          	<img class="Vector" src="/upload_item/star3.png">
	        </div>
	      </div>
	      <div style="left: 83px; top: 0px; position: absolute; color: black; font-size: 15px; font-family: Jost; font-weight: 400; line-height: 22.50px; word-wrap: break-word">(</div>
	      <div class="Link" style="left: 87.66px; top: 0px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	        <div style="color: black; font-size: 15px; font-family: Jost; font-weight: 400; line-height: 22.50px; word-wrap: break-word">3</div>
	      </div>
	      <div style="left: 95.86px; top: 0px; position: absolute; color: black; font-size: 15px; font-family: Jost; font-weight: 400; line-height: 22.50px; word-wrap: break-word">)</div>
	    </div>
	    <div class="Price" style="width: 216.88px; height: 32px; left: 0px; top: 111.50px; position: absolute">
	      <div class="DivFPriceSale" style="left: -0.50px; top: -1px; position: absolute; justify-content: flex-start; align-items: flex-end; gap: 7.17px; display: inline-flex">
	        <div class="SpanFPriceItem" style="padding-bottom: 1px; justify-content: flex-start; align-items: flex-start; display: flex">
	          <div class="3900" style="color: black; font-size: 24px; font-family: Volkhov; font-weight: 400; line-height: 32px; word-wrap: break-word"><fmt:formatNumber value="${item.it_price }" pattern="#,###원"/></div>
	        </div>
	        <div class="Strikethrough" style="padding-top: 5.41px; padding-bottom: 6.59px; justify-content: flex-start; align-items: center; display: flex">
	          <div class="5900" style="color: #666666; font-size: 16px; font-family: Jost; font-weight: 400; text-decoration: line-through; line-height: 19.20px; word-wrap: break-word"><fmt:formatNumber value="${item.it_sale }" pattern="#,###원"/></div>
	        </div>
	      </div>
	    </div>
	    <div class="ProductView" style="width: 585px; height: 24px; left: 0px; top: 173.50px; position: absolute">
	      <div class="Svg" style="width: 20px; padding-top: 3.61px; padding-bottom: 3.61px; left: -0px; top: 2px; position: absolute; opacity: 0.97; justify-content: flex-start; align-items: flex-start; display: inline-flex">
				<img class="Vector" src="/upload_item/eye.png"> 
	      </div>
	      <div class="DivLiveViewsText" style="width: 287px; height: 25px; left: 30px; top: -1px; position: absolute">
	        <div class="PeopleAreViewingThisRightNow" style="left: 0px; top: 0px; position: absolute; color: #8A8A8A; font-size: 16px; font-family: Poppins; font-weight: 400; line-height: 24px; word-wrap: break-word"></div>
	      </div>
	    </div>
	    <div class="StockStat" style="height: 42px; left: 0px; top: 310.50px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 12px; display: inline-flex">
	      <div class="DivTextColorProdDesc" style="width: 585px; padding-bottom: 1px; padding-right: 402px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	        <div class="Only9ItemSLeftInStock">
	        <span style="color: #666666; font-size: 16px; font-family: Jost; font-weight: 400; line-height: 24px; word-wrap: break-word"> </span>
		        <span style="color: #666666; font-size: 16px; font-family: Jost; font-weight: 700; line-height: 24px; word-wrap: break-word"></span>
		        <span style="color: #666666; font-size: 16px; font-family: Jost; font-weight: 400; line-height: 24px; word-wrap: break-word"></span>
	        </div>
	      </div>
	     <!--  <div class="DivFoxkitStockCountdownBar" style="width: 585px; padding-right: 555.75px; background: #DEDEDE; border-radius: 2px; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	        <div class="DivFoxkitStockCountdownProgress" style="width: 29.25px; height: 5px; background: #EF2D2D; border-radius: 2px"></div>
	      </div> -->
	    </div>
	    
	    <!-- 사이즈 -->
	    <div class="SizeAndColor" style="left: 0px; top: 300.50px; position: absolute; flex-direction: column; justify-content: flex-start; align-items: flex-start; gap: 14px; display: inline-flex">
	      <div class="VariantButton" style="width: 585px; height: 86px; position: relative">
	        <div class="Label" style="padding-bottom: 1px; left: -1.50px; top: -1px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	          <div class="SizeM">
	          	<span style="color: black; font-size: 16px; font-family: Volkhov; font-weight: 700; line-height: 24px; word-wrap: break-word">Size:</span>
	          	<span style="color: black; font-size: 16px; font-family: Volkhov; font-weight: 400; line-height: 24px; word-wrap: break-word">${it_size}</span>
	          	<select id="it_size" name="it_size" onchange="updateHiddenValue()" required style="width:250px; height:30px">
	          		<option value=" ">-----------선택-----------</option>
				    <option value="XS">XS</option>
				    <option value="S">S</option>
				    <option value="M">M</option>
				    <option value="L">L</option>
				    <option value="XL">XL</option>
				    <option value="XXL">XXL</option>
				</select>
	          </div>
	        </div>
	      </div>
	    </div>
	    
	    <!-- 가격비교 -->
	    <div style="width: 550px; height: 100px; left: 0px; top: 400px; position: absolute; background: white">
		  <div style="width: 200px; height: 30px; left: 314px; top: 100px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">
		    <% List<ProductS> ssgProducts = (List<ProductS>) request.getAttribute("ssgProducts"); %>
		    <% if (ssgProducts != null && !ssgProducts.isEmpty()) { %>
		      <% ProductS ssgProduct = ssgProducts.get(0); %>
		      <div style="margin-top: 5px; font-weight: bold;">
    				<fmt:formatNumber value="<%= ssgProduct.getDiscountPrice() %>" pattern="#,###원"/>
				</div>
		    <% } else { %>
		      <div style="margin-top: 5px;">가격 정보 없음</div>
		    <% } %>
		  </div>
		  <div style="width: 200px; height: 30px; top: 100px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">SSG</div>
		  <div style="width: 200px; height: 30px; left: 314px; top: 60px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">
		    <% List<ProductM> musinsaProducts = (List<ProductM>) request.getAttribute("musinsaProducts"); %>
		    <% if (musinsaProducts != null && !musinsaProducts.isEmpty()) { %>
		      <% ProductM musinsaProduct = musinsaProducts.get(0); %>
		      <div style="margin-top: 5px; font-weight: bold;">
    				<fmt:formatNumber value="<%= musinsaProduct.getOriginalPrice() %>" pattern="#,###원"/>
				</div>
		    <% } else { %>
		      <div style="margin-top: 5px;">가격 정보 없음</div>
		    <% } %>
		  </div>
		  <div style="width: 200px; height: 30px; top: 60px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">Musinsa</div>
		  <div style="width: 200px; height: 30px; left: 314px; top: 20px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">
		    <% List<ProductE> emartProducts = (List<ProductE>) request.getAttribute("emartProducts"); %>
		    <% if (emartProducts != null && !emartProducts.isEmpty()) { %>
		      <% ProductE emartProduct = emartProducts.get(0); %>
		      <div style="margin-top: 5px; font-weight: bold;">
    				<fmt:formatNumber value="<%= emartProduct.getOriginalPrice() %>" pattern="#,###원"/>
				</div>
		    <% } else { %>
		      <div style="margin-top: 5px;">가격 정보 없음</div>
		    <% } %>
		  </div>
		  <div style="width: 200px; height: 30px; top: 20px; position: absolute; color: black; font-size: 12px; font-family: Inter; font-weight: 400; word-wrap: break-word">EmartMall</div>
		</div>

	    <!-- 수량 -->
	    <div class="Quantity" style="width: 585px; height: 148px; left: -1px; top: 575px; position: absolute">
	      <div class="LabelQuantity" style="left: 0px; top: 0px; position: absolute; color: black; font-size: 16px; font-family: Volkhov; font-weight: 400; line-height: 24px; word-wrap: break-word">수량</div>
	      <div class="DivFlex" style="width: 585px; height: 111px; left: 0px; top: 37px; position: absolute">
	      	<table width=100% height=100% border=0 style="margin: 10px">
	      	<tr>
	      		<td colspan="2" align="center">
					<input type="button" value="-" onclick="qty_num('-')" style="width:44px;height:30px; border-radius:5px; border:1px solid gray;">
					<input id="it_qty" name="it_qty" value="1" style="text-align:center;width:150px; height:30px;border:1px solid blue; text-align:center border:1px solid gray;">
					<input type="button" value="+" onclick="qty_num('+')" style="width:44px;height:30px; border-radius:5px; border:1px solid gray;">
				</td>
			</tr>
			<tr height="100%">
				<td align="center">
					<input height="30" type="button" value="장바구니" onclick="cart_order('c')" style="width:200px;height:30px; border-radius:5px; border:1px solid gray;" >
				</td>
				<td align="center">
					<input height="30" type="button" value="바로구매" onclick="cart_order('o')" style="width:200px;height:30px; border-radius:5px; border:1px solid gray;">
					<input type="hidden" id="order" name="order" value="">
				</td>
			</tr>
		 	</table>
	      </div>
	    </div>
	    <div class="ProductTools" style="width: 585px; height: 46px; left: 0px; top: 737.50px; position: absolute; border-bottom: 1px #EEEEEE solid">
	      <div class="DivProdFormButtons" style="width: 595px; padding-right: 221.45px; left: -5px; top: 0px; position: absolute; justify-content: flex-start; align-items: flex-start; gap: 30px; display: inline-flex">
	        <div class="Link" style="width: 100.48px; height: 34px; position: relative">
	          <div class="Svg" style="width: 20px; padding-top: 1.25px; padding-bottom: 1.25px; padding-left: 3.12px; padding-right: 3.13px; left: 5px; top: 7px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	          	<img class="Vector" src="/upload_item/Compare.png"> 
	          </div>
	          <div class="SpanMl2" style="padding-bottom: 1px; left: 33px; top: 4px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	            <div class="Compare" style="color: black; font-size: 16px; font-family: Jost; font-weight: 400; line-height: 24px; word-wrap: break-word">비교</div>
	          </div>
	        </div>
	        <div class="Link" style="width: 136.70px; height: 34px; position: relative">
	          <div class="Svg" style="width: 20px; padding: 0.31px; left: 5px; top: 7px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	            <img class="Vector" src="/upload_item/ask.png"> 
	          </div>
	          <div class="SpanMl2" style="padding-bottom: 1px; left: 33px; top: 4px; position: absolute; justify-content: flex-start; align-items: flex-start; display: inline-flex">
	            <div class="AskAQuestion" style="color: black; font-size: 16px; font-family: Jost; font-weight: 400; line-height: 24px; word-wrap: break-word">문의</div>
	          </div>
	        </div>
	       </div>
	    </div>
	    <div class="Info" style="width: 585px; height: 56px; left: 0px; top: 813.50px; position: absolute">
	      <div class="Item" style="width: 585px; height: 24px; left: 0px; top: 0px; position: absolute">
	        <div class="P" style="padding-bottom: 1px; left: 26.50px; top: -1px; position: absolute; justify-content: flex-start; align-items: flex-start; gap: 2.86px; display: inline-flex">
	          <div class="StrongEstimatedDelivery" style="color: black; font-size: 16px; font-family: Volkhov; font-weight: 700; line-height: 24px; word-wrap: break-word">상품 등록일: </div>
	          <div class="Jul30Aug03" style="color: black; font-size: 16px; font-family: Jost; font-weight: 400; line-height: 24px; word-wrap: break-word">${item.it_date}</div>
	        </div>
	      </div>
	      <div class="Item" style="width: 585px; height: 24px; left: 0px; top: 32px; position: absolute">
	        <div class="P" style="width: 368px; height: 25px; left: 27px; top: -1px; position: absolute">
	          <div class="StrongFreeShippingReturns" style="left: 0px; top: 0px; position: absolute"><span style="color: black; font-size: 16px; font-family: Volkhov; font-weight: 700; line-height: 24px; word-wrap: break-word">Free Shipping & Returns: </span><span style="color: black; font-size: 16px; font-family: Volkhov; font-weight: 400; line-height: 24px; word-wrap: break-word"></span></div>
	        </div>
	      </div>
	    </div>
	    <!-- <div class="PaymentOptions" style="width: 585px; height: 108.92px; left: 0px; top: 899.50px; position: absolute; background: #F8F8F8; border-radius: 5px">
	      <div class="Cards" style="width: 320px; padding-top: 0.69px; left: 132.50px; top: 20px; position: absolute; justify-content: center; align-items: flex-start; display: inline-flex">
	        <div class="ResponsiveImage" style="width: 320px; height: 25.23px; position: relative">
	          <img class="TrustbagPng" style="width: 320px; height: 25.23px; left: 0px; top: 0px; position: absolute" src="https://via.placeholder.com/320x25" />
	        </div>
	      </div>
	      <div class="Heading4GuaranteeSafeSecureCheckout" style="left: 161.78px; top: 66.92px; position: absolute; text-align: center; color: black; font-size: 16px; font-family: Volkhov; font-weight: 400; word-wrap: break-word">Guarantee safe & secure checkout</div>
	    </div> -->
	  </div>
	</div>
	</form>
	<div class="Quantity" style="width: 100%; height: 148px; top: -150px; right:-400px; position: relative; text-align: center; color: black; font-size: 16px; font-family: Volkhov; font-weight: 400;">
		<div class="LabelQuantity" style="left: 0px; top: 0px; position: absolute; color: black; font-size: 16px; font-family: Volkhov; font-weight: 400; line-height: 24px; word-wrap: break-word">후기</div>
		<form action="itemcommentin" method="post">
			<input type="hidden" name="it_uid" value="${item.it_uid}" />
			<input type="hidden" name="uid" value="${rev.uid}" />
			<input type="hidden" name="pageNum" value="${param.pageNum}" />
			<input type="hidden" name="field" value="${param.field}" />
			<input type="hidden" name="search" value="${param.search}" />
			<table align="center">
				<tr height="50">
					<td><input id="tb_comment" name="tb_comment" style="width: 372px; height: 40px; left: 90px; background: #F7F6F9; border-radius: 8px; border: none; outline: none; caret-color: black;"></td>
			        <td align="right">
			        	<button style="border: none; width: 50px; height: 40px;">
			      			<img src = "/img/search.png" style=" width: 100%; height: 100%;">
			      		</button>
			        </td>
			   </tr>
			   <tr><td colspan="2" height="1" bgcolor="#97b1ec"></td></tr>
			</table>
	    </form> 
		<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
		   	<tr><td colspan="3" height="1" bgcolor="#97b1ec"></td></tr>
	    	<c:set var="number" value="${number}" />
			<c:forEach var="review" items="${v1}" varStatus="status">
			    <tr height="100%" style="background-color: ${status.count % 2 == 1 ? '#f5f5f5' : 'white'};">
			        <td style="width: 20%;">작성자: ${review.tb_id}</td>
			        <td>${review.tb_comment}</td>
			        <td>작성일: ${review.tb_date}</td>
			        <td>
			            <a href="commentde?tb_uid=${review.tb_uid}&uid=${it_uid}">[삭제]</a>
			        </td>
			   </tr>
			    <tr>
			        <td colspan="4" height="1" width="100%"></td>
			    </tr>
			</c:forEach>
			<c:if test="${empty v1}">
			    <p>검색 결과가 없습니다.</p>
			</c:if>
			   <tr><td colspan="3" height="1" bgcolor="#97b1ec"></td></tr>
		   </table>
	</div>
<script>
  //수량 증가,감소 처리
  
  function qty_num(str){
    var num = parseInt(cart_insert.it_qty.value);
    if(str == "-"){ //차감
      if(num == 1){
        alert("주문 최소 수량은 1개입니다.");
      }else{
        cart_insert.it_qty.value = num - 1;
      }		
    }else{ //증가
      cart_insert.it_qty.value = num + 1;
    }
  }
  
  //장바구니 , 바로구매 버튼 처리
  function cart_order(str){
    order.value = str;
    document.cart_insert.submit();
  }
  
  function updateHiddenValue() {
      // select 태그에서 선택된 값을 가져옵니다.
      var selectedValue = document.getElementById("it_size").value;
      
      // hidden input의 값을 변경합니다.
      document.getElementById("hidden_it_size").value = selectedValue;
  }
  var productDetail = document.getElementById('ProductDetail');

//Get all elements with class 'DivSwiperSlide'
var swiperSlides = document.getElementsByClassName('DivSwiperSlide');

//Loop through each 'DivSwiperSlide' element
for (var i = 0; i < swiperSlides.length; i++) {
   // Add an onclick event handler to each 'DivSwiperSlide' element
   swiperSlides[i].addEventListener('click', function() {
       // Get the image source from the clicked element
       var imgSrc = this.querySelector('img').src;
       
       // Change the image source in the 'ProductDetail' area
       productDetail.querySelector('img').src = imgSrc;
   });
}
  </script>
  <%@ include file="/admin/include/footer.jsp" %>
