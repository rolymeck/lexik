<#import "fragment/common.ftlh" as c>
<#import "fragment/account.ftlh" as acc>

<@c.page "Сообщения | Lexik.me">
    <main class="container mt-5">
        <div class="form-row">
            <div class="form-group col-md-6">
                <form method="get" action="/main" class="form-inline">
                    <input type="text" name="filter" class="form-control" value="${filter?ifExists}"
                           placeholder="Search by tag">
                    <button type="submit" class="btn btn-primary ml-2">Search</button>
                </form>
            </div>
        </div>
        <#include "fragment/messageEdit.ftlh">
        <#include "fragment/messageList.ftlh">
    </main>
</@c.page>