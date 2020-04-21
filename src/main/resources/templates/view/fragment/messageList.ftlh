<#include "security.ftlh">
<#import "pager.ftlh" as p>

<@p.pager url page />

<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3">
            <#if message.filename??>
                <img src="/img/${message.filename}" class="card-img-top"/>
            </#if>
            <div class="m-2">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a>
                <#if user.id == message.author.id>
                    <a class="btn btn-primary"
                       href="/user-messages/${message.author.id}?message=${message.id}">Изменить</a>
                </#if>
            </div>
        </div>
    <#else>
        No message
    </#list>
</div>