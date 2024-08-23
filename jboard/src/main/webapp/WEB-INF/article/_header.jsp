<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

        <header>
            <h3>Board System v1.0</h3>
            <p>
                 ${sessionScope.sessUser.nick }님 반갑습니다.
                <a href="/jboard/user/logout.do" class="logout">[로그아웃]</a>
            </p>
        </header>
        