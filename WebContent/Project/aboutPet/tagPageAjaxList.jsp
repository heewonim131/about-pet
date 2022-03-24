<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="sticky_filter_top">
							<div class="inr">
								<div class="uioptsorts tag">
									<div class="dx lt">
										<div class="tot">
											펫샵 상품 <em class="n">${count } 개</em>
										</div>
									</div>
									<div class="dx rt">
										<nav class="filter">
											<button type="button" class="bt filt" id="btnFilter"
												onclick="filter.open();">
												필터<i class="n" id="filCount">()</i>
											</button>
										</nav>
										<nav class="uisort">
											<button type="button" class="bt st" value=""></button>
											<div class="list">
												<ul class="menu">
													<li id="order_SALE"><button type="button" class="bt"
															value="SALE" onclick="filter.detail('del',this.value);">판매인기순</button></li>
													<li id="order_LOW"><button type="button" class="bt"
															value="LOW" onclick="filter.detail('del',this.value);">낮은가격순</button></li>
													<li id="order_HIGH"><button type="button" class="bt"
															value="HIGH" onclick="filter.detail('del',this.value);">높은가격순</button></li>
													<li id="order_SCORE"><button type="button" class="bt"
															value="SCORE" onclick="filter.detail('del',this.value);">상품평순</button></li>
													<li id="order_DATE"><button type="button" class="bt"
															value="DATE" onclick="filter.detail('del',this.value);">등록일순</button></li>
												</ul>
											</div>
										</nav>
									</div>
								</div>
							</div>
						</div>
						<ul class="list" id="pagingGoods">
							<c:forEach items="${list }" var="list">
								<li>
									<div class="gdset cates">
										<div class="thum">
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
												class="pic" data-content='${list.item_code }'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">
												<img class="img" src="${list.item_img }"
												alt="${list.item_name }">
											</a>
											<button type="button" class="bt zzim "
												data-content='${list.item_code }'
												data-url="/goods/insertWish?goodsId=PI000013349"
												data-action="interest" data-yn="N"
												data-goods-id="${list.item_code }" data-target="goods">찜하기</button>
										</div>
										<div class="boxs">
											<div class="tit">
												<a
													href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
													class="lk" data-content='${list.item_code }'
													data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">${list.item_name }</a>
											</div>
											<a
												href="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }"
												class="inf" data-content='${list.item_code }'
												data-url="/AboutPet/Project/aboutPet/itemDetail.do?item_code=${list.item_code }">

												<c:if test="${ list.sale_rate ne 0 }">
													<span class="prc"><em class="p"><fmt:formatNumber
																pattern="#,###"
																value="${ list.item_price * (1 - 0.01 * list.sale_rate)  }"></fmt:formatNumber></em></span>
													<span class="pct"><em class="n">${list.sale_rate }</em><i
														class="w">%</i></span>
												</c:if> <c:if test="${ list.sale_rate eq 0 }">
													<span class="prc"><em class="p"><fmt:formatNumber
																pattern="#,###" value="${ list.item_price }"></fmt:formatNumber></em></span>
												</c:if>
											</a>
										</div>
									</div>
								</li>
							</c:forEach>
						</ul>