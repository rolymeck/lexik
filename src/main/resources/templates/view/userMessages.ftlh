<#import "fragment/common.ftlh" as c>

<@c.page "Сообщения ${username}| Lexik.me">
    <main class="container mt-5">
        <#if isCurrentUser>
            <#include "fragment/messageEdit.ftlh">
        </#if>
        <#include "fragment/messageList.ftlh">
    </main>
</@c.page>