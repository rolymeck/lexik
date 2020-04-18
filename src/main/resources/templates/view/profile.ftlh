<#import "fragment/common.ftlh" as c>

<@c.page "${username} | Lexik.me">
    <main class="mt-5">
        <div class="row justify-content-center pb-5">
            <div class="col-12 col-sm-8 col-md-7 col-lg-4">
                <div class="mb-5">
                    <div class="shadow border-top border-secondary">
                        <div class="card-body">
                            <h1 class="h3 mb-1 mt-2 text-center">${username}</h1>
                            <#if message??>
                                <div>${message}</div>
                            </#if>
                            <form method="post">

                                <input type="text" class="form-control my-3" name="username" value="${username}"
                                       placeholder="username">

                                <input type="email" class="form-control my-3" name="email" value="${email!''}"
                                       placeholder="email">

                                <input type="password" class="form-control my-3" name="password"
                                       placeholder="password">

                                <input type="hidden" name="_csrf" value="${_csrf.token}">

                                <button type="submit" class="btn btn-primary btn-block">Сохранить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</@c.page>