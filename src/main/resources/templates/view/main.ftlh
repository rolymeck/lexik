<#import "fragment/common.ftlh" as c>
<#import "fragment/account.ftlh" as acc>

<@c.page "Сообщения | Lexik.me">
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
</@c.page>