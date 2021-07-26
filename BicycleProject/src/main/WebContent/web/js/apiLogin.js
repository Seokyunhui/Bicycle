/**
 * 
 */

     // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('6ecda6ad3053f7eefa115aa0b6703984');
    //카카오로그인
      function kakaoLogin() {
          Kakao.Auth.login({
            success: function (response) {
              Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
              	  console.log(response)
              	  var userid = response.id;
              	  var name = response.properties.nickname;
              	  var url = "./login_apiprocess.jsp?id=" + encodeURI(userid)+ "&name="+encodeURI(name);
              	  window.location.href = url;     
                },
                fail: function (error) {
                  console.log(error)
                },
              })
            },
            fail: function (error) {
              console.log(error);
            },
          })
        }
      //카카오로그아웃  
      function kakaoLogout() {
          if (Kakao.Auth.getAccessToken()) {
            Kakao.API.request({
              url: '/v1/user/unlink',
              success: function (response) {
              	console.log(response)
              },
              fail: function (error) {
                console.log(error)
              },
            })
            Kakao.Auth.setAccessToken(undefined)
          }
        } 