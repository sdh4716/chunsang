<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="/admin" ><i class="menu-icon fa fa-laptop "></i>대쉬보드</a>
                </li>
                <!-- <li class="menu-title">화면관리</li>/.menu-title
                <li class="menu-item-has-children dropdown" id="mainImgMng">
                    <a href="/admin/image_main" class="dropdown-toggle active"> <i class="menu-icon fa fa-cogs"></i>이미지 관리</a>
                </li>
                <li class="menu-title">상품관리</li>
                <li class="menu-item-has-children dropdown">
                    <a href="/admin/image_main" class="dropdown-toggle active"> <i class="menu-icon fa fa-cogs"></i>상품관리</a>
                </li> -->
                <li class="menu-title">게시판 관리</li>
                <li class="menu-item-has-children dropdown" id="noticeMng">
                    <a href="/admin/noticeMng" class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>공지사항 관리</a>
                </li>
                <li class="menu-item-has-children dropdown" id="specialMng">
                    <a href="/admin/boardDetail?boardId=SPECIAL&seq=1" class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>부대시설 관리</a>
                </li>
                <li class="menu-item-has-children dropdown" id="galleryMng">
                    <a href="/admin/galleryMng" class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>갤러리 관리</a>
                </li>
                <li class="menu-title">객실 관리</li>
                <li class="menu-item-has-children dropdown" id="noticeBoardMng">
                    <a href="/admin/roomPriceMng" class="dropdown-toggle"> <i class="menu-icon fa fa-cogs"></i>객실 요금 관리</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->
</html>
