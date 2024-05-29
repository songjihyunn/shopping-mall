<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
 body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1A1919;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            min-height: 100vh;
        }
        .footer-sidebar {
            width: 300px;
            height: 100%;
            padding: 24px;
            position: fixed;
            top: 0;
            left: 0;
            background: #1A1919;
            display: flex;
            flex-direction: column;
            gap: 150px;
        }
        .footer-menu{
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .footer-logout {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        .footer-menu-item, .footer-logout-item {
            padding: 12px 16px;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            font-family: Inter;
            font-weight: 400;
            line-height: 24px;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .footer-menu-item:hover, .footer-logout-item:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .footer-menu-item.active, .footer-logout-item.active {
            color: white;
            background: #191919;
        }
        .footer-logout-item1:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .footer-logout-item1.active {
            color: white;
            background: #red; /* 수정: 여기에 원하는 색상을 입력하세요 */
        }
        .footer-menu-divider {
            width: 176px;
            height: 1px;
            background: rgba(255, 255, 255, 0.20);
            margin: 8px 0;
        }
    </style>

<div class="footer-sidebar">
    <div class="footer-menu">
        <div class="footer-menu-item" onclick="location.href ='/admin/member/list'">회원관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/bbs/list'">고객센터 관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/item/list'">물품관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/category/list'">분류관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/cart/list'">장바구니 관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/order/list'">주문관리</div>
        <div class="footer-menu-item" onclick="location.href ='/admin/item/gall'">갤러리</div>
        <div class="footer-menu-item" onclick="location.href ='/'">메인메뉴</div>
        <div class="footer-menu-divider"></div>
    </div>
    <div class="footer-logout">
        <div class="footer-logout-item" onclick="location.href ='/member/logout'">
            <div style="display: flex; align-items: center; gap: 12px;">
                <div style="font-size:20px">Logout</div>
            </div>
        </div>
    </div>
</div>
<script>
    // 모든 footer-menu-item 요소를 선택합니다.
    const menuItems = document.querySelectorAll('.footer-menu-item, .footer-logout-item');

    // 모든 menu-item 요소에 클릭 이벤트 리스너를 추가합니다.
    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            // 모든 요소의 active 클래스를 제거합니다.
            menuItems.forEach(element => {
                element.classList.remove('active');
            });

            // 클릭된 요소에 active 클래스를 추가합니다.
            this.classList.add('active');
        });

        // 페이지 로드 시 각 요소의 초기 색상을 흰색으로 설정합니다.
        item.style.color = 'white';
    });
</script>
</body>
</html>