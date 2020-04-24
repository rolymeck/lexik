<#import "fragment/common.ftlh" as c>

<@c.page "${userChannel.username}">
    <main class="container mt-5">
        <h3>${userChannel.username}</h3>
        <div>${type}</div>
        <ul class="list-group">
            <#list users as user>
                <li class="list-group-item">
                    <a href="/user-messages/${user.id}">${user.getUsername()}</a>
                </li>
            </#list>
        </ul>
    </main>
</@c.page>