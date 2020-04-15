<#import "fragment/account.ftlh" as acc>

<!doctype html>
<html>
<head>
    <title>Lexik.me</title>
    <#include "fragment/head.ftlh">
</head>
<body>

<h1 class="titile">Lexik.me</h1>
<p class="subtitle">Бесплатный тренажер английской грамматики</p>
<div class="field">
    <div class="control">
        <input class="input" type="text" placeholder="Input">
    </div>
</div>

<div class="field">
    <p class="control">
          <span class="select">
            <select>
              <option>Select dropdown</option>
            </select>
          </span>
    </p>
</div>

<div class="buttons">
    <a class="button is-primary">Primary</a>
    <a class="button is-link">Link</a>
</div>
<hr>
<div>
    <@acc.logoutButton/>
    <a href="/u">Users</a>
</div>
<form action="/main" method="post" enctype="multipart/form-data">
    <input type="text" name="text" placeholder="Введите сообщение">
    <input type="text" name="tag" placeholder="Тэг">
    <input type="file" name="file">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <button type="submit">Добавить</button>
</form>
<div>Список сообщений</div>
<form action="/main" method="get">
    <input type="text" name="filter" value="${filter!}">
    <button type="submit">Найти</button>
</form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
        <#if message.filename??>
            <div><img src="/img/${message.filename}" alt="image"></div>
        </#if>
    </div>
</#list>

</body>
</html>