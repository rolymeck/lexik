<#include "security.ftlh">

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">
        <img src="/static/img/icon/icon@150.png" width="30" height="30" class="d-inline-block align-top"
             alt=""/>
        Lexik.me
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/main">Messages</a>
            </li>
            <#if isAuth>
                <li class="nav-item">
                    <a class="nav-link" href="/user-messages/${user.id}">My messages</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/u/profile">Profile</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/u">Users</a>
                </li>
            </#if>


        </ul>
        <#if isAuth>
            <div class="navbar-text mr-3">${user.username}</div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-outline-primary" type="submit">Sign Out</button>
            </form>
        </#if>
    </div>
</nav>