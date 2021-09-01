//机构和专家切换效果
function chooseI(i) {
    var jian=document.getElementsByClassName('_1_jianjie');
    var chooseone=document.getElementsByClassName('youxiu_up_exp_or_org');
    var more=document.getElementsByClassName('youxiu_up_more');
    var intro=document.getElementsByClassName('_3_youxiu_intro');
    var shili=document.getElementsByClassName('_4_shili');

    if (i == 1){
        /*点击的是专家,以下是显示*/
        jian[0].className="_1_jianjie";
        chooseone[0].className="youxiu_up_exp_or_org";
        more[0].className="youxiu_up_more";
        intro[0].className="_3_youxiu_intro";
        shili[0].className="_4_shili";

        /*不显示*/
        jian[1].className="_1_jianjie Notdisplay";
        chooseone[1].className="youxiu_up_exp_or_org visited";
        more[1].className="youxiu_up_more Notdisplay";
        intro[1].className="_3_youxiu_intro Notdisplay";
        shili[1].className="_4_shili Notdisplay";
    }
    else{
        /*点击的是机构，i=0*/
        jian[1].className="_1_jianjie";
        chooseone[1].className="youxiu_up_exp_or_org";
        more[1].className="youxiu_up_more";
        intro[1].className="_3_youxiu_intro";
        shili[1].className="_4_shili";

        /*不显示*/
        jian[0].className="_1_jianjie Notdisplay";
        chooseone[0].className="youxiu_up_exp_or_org visited";
        more[0].className="youxiu_up_more Notdisplay";
        intro[0].className="_3_youxiu_intro Notdisplay";
        shili[0].className="_4_shili Notdisplay";
    }
}

//个人专区界面，tab的左右切换效果
function chooseLorR(i) {
	//下面是标题的切换
    var ask_title=document.getElementById('tab_li1');
    var answer_title=document.getElementById('tab_li2');
    var send_invite_title=document.getElementById('tab_li3');
    var receive_invite_title=document.getElementById('tab_li4');
    var jiedu_share_title=document.getElementById('tab_li5');
    var shoucang_title=document.getElementById('tab_li6');
    var send_sixin_title=document.getElementById('tab_li7');
    var receive_sixin_title=document.getElementById('tab_li8');
    
    //下面是内容
    var ask=document.getElementById('tab_content1');
    var answer=document.getElementById('tab_content2');
    var send_invite=document.getElementById('tab_content3');
    var receive_invite=document.getElementById('tab_content4');
    var jiedu_share=document.getElementById('tab_content5');
    var shoucang=document.getElementById('tab_content6');
    var send_sixin=document.getElementById('tab_content7');
    var receive_sixin=document.getElementById('tab_content8');
    
    //下面是更多链接
    var more=document.getElementsByClassName('youxiu_up_more');

    if (i == 1){
        /*点击-提问*/
        ask_title.className="tab_li_active";
        ask.className="tab_content";
        answer_title.className="";
        answer.className="tab_content Notdisplay";
        more[0].className="youxiu_up_more";
        more[1].className="youxiu_up_more Notdisplay";
    }
    else if (i == 2){
        /*点击-回答*/
        answer_title.className="tab_li_active";
        answer.className="tab_content";
        ask_title.className="";
        ask.className="tab_content Notdisplay";
        more[1].className="youxiu_up_more";
        more[0].className="youxiu_up_more Notdisplay";
    }
    else if (i == 3){
        /*点击-发出的邀请*/
        send_invite_title.className="tab_li_active";
        send_invite.className="tab_content";
        receive_invite_title.className="";
        receive_invite.className="tab_content Notdisplay";
        more[2].className="youxiu_up_more";
        more[3].className="youxiu_up_more Notdisplay";
    }
    else if (i == 4){
        /*点击-收到的邀请*/
        receive_invite_title.className="tab_li_active";
        receive_invite.className="tab_content";
        send_invite_title.className="";
        send_invite.className="tab_content Notdisplay";
        more[3].className="youxiu_up_more";
        more[2].className="youxiu_up_more Notdisplay";
    }
    else if (i == 5){
        /*点击-解读和分享*/
        jiedu_share_title.className="tab_li_active";
        jiedu_share.className="tab_content";
        shoucang_title.className="";
        shoucang.className="tab_content Notdisplay";
        more[4].className="youxiu_up_more";
        more[5].className="youxiu_up_more Notdisplay";
    }
    else if (i == 6){
        /*点击-收藏*/
        shoucang_title.className="tab_li_active";
        shoucang.className="tab_content";
        jiedu_share_title.className="";
        jiedu_share.className="tab_content Notdisplay";
        more[5].className="youxiu_up_more";
        more[4].className="youxiu_up_more Notdisplay";
    }
    else if (i == 7){
        /*点击-发出私信*/
        send_sixin_title.className="tab_li_active";
        send_sixin.className="tab_content";
        receive_sixin_title.className="";
        receive_sixin.className="tab_content Notdisplay";
        more[6].className="youxiu_up_more";
        more[7].className="youxiu_up_more Notdisplay";

    }
    else if (i == 8){
        /*点击-收到私信*/
        receive_sixin_title.className="tab_li_active";
        receive_sixin.className="tab_content";
        send_sixin_title.className="";
        send_sixin.className="tab_content Notdisplay";
        more[7].className="youxiu_up_more";
        more[6].className="youxiu_up_more Notdisplay";

    }
}