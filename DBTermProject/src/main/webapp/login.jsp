<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
    <style type="text/css">
    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #2E2E2E;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #7f888f;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #2E2E2E;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #2E2E2E;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
label {
   color:red;
   margin-bottom:2em;
}
    </style>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
<% String r = request.getParameter("r"); 
   r = (r==null?"":r);%>
<div id="login_main" class="login login-page main">
  <div class="form">
     <FORM id="frm" METHOD="POST" class="login-form">
        <label><%=r%></label>
       <input type="text" id="id" class="input" name="j_username" placeholder="Id" />
      <input type="password" id="pwd" class="input" name="j_password" placeholder="Password" />
      <button type="button" id="send" class="submit-btn">Log in</button>
    </form>
  </div>
</div>
<script type="text/javascript">
  /**
  *  This pen is just a demo for SHA256.
  *  I've just made the HTML, CSS and the last few lines of this code
  *  
  *  Secure Hash Algorithm (SHA256)
  *  http://www.webtoolkit.info/
  *
  *  Original SHA256 function code by Angel Marin, Paul Johnston.
  *
  **/
  function SHA256(s){
      var chrsz   = 8;
      var hexcase = 0;
      function safe_add (x, y) {
          var lsw = (x & 0xFFFF) + (y & 0xFFFF);
          var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
          return (msw << 16) | (lsw & 0xFFFF);
      }
      function S (X, n) { return ( X >>> n ) | (X << (32 - n)); }
      function R (X, n) { return ( X >>> n ); }
      function Ch(x, y, z) { return ((x & y) ^ ((~x) & z)); }
      function Maj(x, y, z) { return ((x & y) ^ (x & z) ^ (y & z)); }
      function Sigma0256(x) { return (S(x, 2) ^ S(x, 13) ^ S(x, 22)); }
      function Sigma1256(x) { return (S(x, 6) ^ S(x, 11) ^ S(x, 25)); }
      function Gamma0256(x) { return (S(x, 7) ^ S(x, 18) ^ R(x, 3)); }
      function Gamma1256(x) { return (S(x, 17) ^ S(x, 19) ^ R(x, 10)); }
      function core_sha256 (m, l) {
          var K = new Array(0x428A2F98, 0x71374491, 0xB5C0FBCF, 0xE9B5DBA5, 0x3956C25B, 0x59F111F1, 0x923F82A4, 0xAB1C5ED5, 0xD807AA98, 0x12835B01, 0x243185BE, 0x550C7DC3, 0x72BE5D74, 0x80DEB1FE, 0x9BDC06A7, 0xC19BF174, 0xE49B69C1, 0xEFBE4786, 0xFC19DC6, 0x240CA1CC, 0x2DE92C6F, 0x4A7484AA, 0x5CB0A9DC, 0x76F988DA, 0x983E5152, 0xA831C66D, 0xB00327C8, 0xBF597FC7, 0xC6E00BF3, 0xD5A79147, 0x6CA6351, 0x14292967, 0x27B70A85, 0x2E1B2138, 0x4D2C6DFC, 0x53380D13, 0x650A7354, 0x766A0ABB, 0x81C2C92E, 0x92722C85, 0xA2BFE8A1, 0xA81A664B, 0xC24B8B70, 0xC76C51A3, 0xD192E819, 0xD6990624, 0xF40E3585, 0x106AA070, 0x19A4C116, 0x1E376C08, 0x2748774C, 0x34B0BCB5, 0x391C0CB3, 0x4ED8AA4A, 0x5B9CCA4F, 0x682E6FF3, 0x748F82EE, 0x78A5636F, 0x84C87814, 0x8CC70208, 0x90BEFFFA, 0xA4506CEB, 0xBEF9A3F7, 0xC67178F2);
          var HASH = new Array(0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A, 0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19);
          var W = new Array(64);
          var a, b, c, d, e, f, g, h, i, j;
          var T1, T2;
          m[l >> 5] |= 0x80 << (24 - l % 32);
          m[((l + 64 >> 9) << 4) + 15] = l;
          for ( var i = 0; i<m.length; i+=16 ) {
              a = HASH[0];
              b = HASH[1];
              c = HASH[2];
              d = HASH[3];
              e = HASH[4];
              f = HASH[5];
              g = HASH[6];
              h = HASH[7];
              for ( var j = 0; j<64; j++) {
                  if (j < 16) W[j] = m[j + i];
                  else W[j] = safe_add(safe_add(safe_add(Gamma1256(W[j - 2]), W[j - 7]), Gamma0256(W[j - 15])), W[j - 16]);
                  T1 = safe_add(safe_add(safe_add(safe_add(h, Sigma1256(e)), Ch(e, f, g)), K[j]), W[j]);
                  T2 = safe_add(Sigma0256(a), Maj(a, b, c));
                  h = g;
                  g = f;
                  f = e;
                  e = safe_add(d, T1);
                  d = c;
                  c = b;
                  b = a;
                  a = safe_add(T1, T2);
              }
              HASH[0] = safe_add(a, HASH[0]);
              HASH[1] = safe_add(b, HASH[1]);
              HASH[2] = safe_add(c, HASH[2]);
              HASH[3] = safe_add(d, HASH[3]);
              HASH[4] = safe_add(e, HASH[4]);
              HASH[5] = safe_add(f, HASH[5]);
              HASH[6] = safe_add(g, HASH[6]);
              HASH[7] = safe_add(h, HASH[7]);
          }
          return HASH;
      }
      function str2binb (str) {
          var bin = Array();
          var mask = (1 << chrsz) - 1;
          for(var i = 0; i < str.length * chrsz; i += chrsz) {
              bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (24 - i%32);
          }
          return bin;
      }
      function Utf8Encode(string) {
          string = string.replace(/\r\n/g,"\n");
          var utftext = "";
          for (var n = 0; n < string.length; n++) {
              var c = string.charCodeAt(n);
              if (c < 128) {
                  utftext += String.fromCharCode(c);
              }
              else if((c > 127) && (c < 2048)) {
                  utftext += String.fromCharCode((c >> 6) | 192);
                  utftext += String.fromCharCode((c & 63) | 128);
              }
              else {
                  utftext += String.fromCharCode((c >> 12) | 224);
                  utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                  utftext += String.fromCharCode((c & 63) | 128);
              }
          }
          return utftext;
      }
      function binb2hex (binarray) {
          var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
          var str = "";
          for(var i = 0; i < binarray.length * 4; i++) {
              str += hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8+4)) & 0xF) +
              hex_tab.charAt((binarray[i>>2] >> ((3 - i%4)*8  )) & 0xF);
          }
          return str;
      }
      s = Utf8Encode(s);
      return binb2hex(core_sha256(str2binb(s), s.length * chrsz));
  }

  /*var enc = document.getElementById("encryptedData");

  document.getElementById("pwd").addEventListener("keyup",function(){
    enc.innerHTML=SHA256(this.value);
  });*/
  </script>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#send").click(function(){
            var sha_pwd = $("#pwd").val();
            $("#pwd").val(SHA256(sha_pwd));
            $("#frm").attr("action", "j_security_check");
            $("#frm").submit();
        });
    });
    </script>
</body>
</html>