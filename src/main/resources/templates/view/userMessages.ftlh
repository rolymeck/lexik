<#import "fragment/common.ftlh" as c>

<@c.page "Сообщения ${userChannel.username}| Lexik.me">
    <main class="container mt-5">
        <#if !isCurrentUser>
            <#if !isSubscriber>
                <a class="btn btn-info" href="/u/subscribe/${userChannel.id}">Подписаться</a>
            <#else>
                <a class="btn btn-info" href="/u/unsubscribe/${userChannel.id}">Отписаться</a>
            </#if>
        </#if>
        <h3>${userChannel.username}</h3>
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Подписки</div>
                        <h3 class="card-text">
                            <a href="/u/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>

            <div class="col">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title">Подписчики</div>
                        <h3 class="card-text">
                            <a href="/u/subscribers/${userChannel.id}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>


        </div>
        <#if isCurrentUser>
            <#include "fragment/messageEdit.ftlh">
        </#if>
        <#include "fragment/messageList.ftlh">
    </main>
</@c.page>