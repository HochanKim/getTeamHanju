<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="../../css/admin/modifyUser.css" />
    <script src="../../js/jquery.js"></script>
    <script src="../../js/vue.js"></script>
    <title>첫번째 페이지</title>
</head>

<body>
    <jsp:include page="../mainPage/header.jsp"></jsp:include>
    <div id="main">
        <jsp:include page="adminSideBar.jsp"></jsp:include>
        <div id="app">
            <div id="container">
                <h3>유저 관리</h3>
                <hr>
                <table>
                    <tr>
                        <th>유저 목록</th>
                        <td>
                            <section v-model="userList">
                                <option v-for="item in userList" :value="item.userId">{{item.userName}}</option>
                            </section>
                        </td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>권한</th>
                        <td><input type="text"></td>
                    </tr>
                    <tr>
                        <th>포인트</th>
                        <td><input type="text"></td>
                    </tr>
                </table>
                <div>
                    <button>수정하기</button>
                    <button>삭제하기</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../mainPage/footer.jsp"></jsp:include>
</body>
</html>

<script>
    const app = Vue.createApp({
        data() {
            return {
                userList : [],
            };
        },
        methods: {
            fnGetUserList() {
                $.ajax({
					url:"getUserList.dox",
					dataType:"json",
					type : "POST", 
					data : {},
					success : (data) => {
						console.log(data);
					}
				});
            }
        },
        mounted() {
            this.fnGetUserList();
        },
    });
    app.mount("#app");
</script>