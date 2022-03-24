<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
	var hiddenYn = '';
	var rplAlmRcvYn = '';
	$(function(){
		if(hiddenYn =='Y'){
			$("#hiddenYnChck").trigger('click');
		}
		if(rplAlmRcvYn == 'Y'){
			$("#rplAlmRcvYnChck").trigger('click');
		}
		qnaImgCheck();

		$(document).off("click" , ".popLayer:not(.win) .btnPopClose:not(.none)");
	})
</script>
<article class="popLayer a popQnaMod" id="popQnaMod" >
	<div class="pbd">
		<div class="phd">
			<div class="in">
				<h1 class="tit">상품 문의하기</h1>
				<button type="button" class="btnPopClose" name="notClose">닫기</button>
			</div>
		</div>
		<form id="qnaForm">
			<input type="hidden" name="goodsIqrNo" value=""/>
			<div class="pct">
				<main class="poptents">
					<div class="uiqnaset">
						<div class="set memo">
							<div class="textarea">
								<textarea id = "iqrContent" name="iqrContent" placeholder="문의내용을 입력해주세요. (최소 5자 이상)"></textarea>
							</div>
						</div>
						<div class="set file">
							<div class="addfile">
								<div class="btnSet">
									<button type="button" class="btn lg btnAddPic" onclick="$('#imgAdd-qna').trigger('click')" id="imgAddBtn-qna">사진 첨부하기</button>
									<input type="file" id="imgAdd-qna" onclick="goodsQna.imageUpload(); return false;" style="display: none;" accept="image/*"/>
								</div>
								<ul class="photo" id="qnaImgArea">
									<!-- <li id="qnaImgArea_1"><span class="pic"><img class="img" src="../../_images/_temp/goods_1.jpg" alt="사진"><button type="button" class="bt del">삭제</button></span></li> -->
									</ul>
							</div>
							<p class="gmsg info-t1">이미지는 20MB 이내 JPG, PNG 파일만 등록 가능합니다.<br/>(최대 5장 첨부 가능)</p>
						</div>
						<div class="set chck">
							<input type="hidden" name="hiddenYn" value="N">
							<input type="hidden" name="rplAlmRcvYn" value="N">
							<label class="checkbox"><input type="checkbox" id="hiddenYnChck" name="hiddenYnChck"><span class="txt"><em class="tt">문의글 비공개 설정하기</em></span></label>
							<!--TODO  -->
						<label class="checkbox"><input type="checkbox" id="rplAlmRcvYnChck" name="rplAlmRcvYnChck"><span class="txt"><em class="tt">답변등록 앱으로 알림 받기</em></span></label>
						</div>
						<div class="set btts">
							<div class="btnSet">
								<button type="button" class="btn lg d" onclick="ui.popLayer.close('popQnaMod');">취소</button>
								<button type="button" class="btn lg a disabled" id="insertQna">등록</button>
							</div>
						</div>
						<div class="set gud">
							<div class="hdt">
								<span class="tit">유의사항 </span>
							</div>
							<div class="cdt info-txt" data-ui-tog="ctn open" data-ui-tog-val="tog_guds_1">
								<ul>
									<li>개인정보가 포함된 문의 시 비공개로 문의해 주시기 바랍니다.</li>
									<li>저작권 침해, 음락, 욕설, 비방글, 판매, 광고 및 홍보성의 글은 임의로 삭제 처리 될 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</main>
			</div>
		</form>
	</div>
</article>