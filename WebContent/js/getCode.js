function validateCode(n){
    //验证码可能包含的字符
    var s="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    var ret=""; //用于保存生成的验证码
    //利用循环,随机产生生成验证码的每一个字符
    for(var i=0;i<n;i++) {
        var index = Math.floor(Math.random() * 62); //随机产生一个0~62之间的数字
        ret += s.charAt(index);//将随机产生的数字当作字符串的位置下标,在字符串s中取出该字符，并加入到ret中
    }
        return ret; //返回产生的验证码
}
/* 显示随机数的函数 */
function show() {
    document.getElementById("msg").innerHTML=validateCode(4);//在id为msg的对象显示验证码
}
window.onload=show();//在整个页面加载完成后执行此函数