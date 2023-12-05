function checkSignUpForm() {
  var username = document.getElementById("username");
  var password = document.getElementById("password");
  var nickname = document.getElementById("nickname");
  var birthAt = document.getElementById("birthAt");
  var genderMale = document.getElementById("male");
  var genderFemale = document.getElementById("female");

  if (username.value.length < 5 || username.value.length > 12) {
    alert("[사용자 아이디]\n5자 이상 12자 이하로 입력하세요");
    username.focus();
    return false;
  }

  var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,16}$/;
  if (!passwordRegex.test(password.value)) {
    alert("[비밀번호]\n8자 이상 16자 이하이며, 영문자와 숫자를 혼합하여 입력하세요");
    password.focus();
    return false;
  }

  if (nickname.value.length < 2 || nickname.value.length > 10) {
    alert("[닉네임]\n2자 이상 10자 이하로 입력하세요");
    nickname.focus();
    return false;
  }

  if (!birthAt.value) {
    alert("[생년월일]\n생년월일을 선택하세요");
    birthAt.focus();
    return false;
  }

  if (!genderMale.checked && !genderFemale.checked) {
    alert("[성별]\n성별을 선택하세요");
    return false;
  }

  return true;
}
