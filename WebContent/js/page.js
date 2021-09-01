(function($, window, document) {
    // 定义构造函数
    function Paging(el, options) {
        this.el = el;
        this.options = {
            pageNo: options.initPageNo || 1, // 初始页码
            totalPages: options.totalPages || 1, //总页数
            totalCount: options.totalCount || '', // 条目总数
            slideSpeed: options.slideSpeed || 0, // 缓动速度
            jump: options.jump || false, // 支持跳转
            callback: options.callback || function() {} // 回调函数
        };
        // 初始化完成是否立刻加载（默认是立即加载）
        if(options.initLoad == undefined || options.initLoad == null) {
        		this.options.initLoad = true;
        } else {
        		this.options.initLoad = options.initLoad;
        }
        this.init();
    }
    // 给实例对象添加公共属性和方法
    Paging.prototype = {
        constructor: Paging,
        init: function() {
            this.createDom();
            this.bindEvents();
            
            if(this.options.totalPages <= 1) {
            		this.el.hide();
            } else {
            		this.el.show();
            }
        },
        createDom: function() {
            var that = this,
                ulDom = '',
                jumpDom = '',
                content = '',
                liWidth = 60, // li的宽度
                totalPages = that.options.totalPages, // 总页数
                wrapLength = 0;
            totalPages > 5 ? wrapLength = 5 * liWidth : wrapLength = totalPages * liWidth;
            for (var i = 1; i <= that.options.totalPages; i++) {
                i != 1 ? ulDom += '<li class="selpage">' + i + '</li>' : ulDom += '<li class="sel-page">' + i + '</li>';
            }
            that.options.jump ? jumpDom = '<input type="text" placeholder="1" class="jump-text" id="jumpText"><button type="button" class="jump-button" id="jumpBtn">跳转</button>' : jumpDom = '';
            content = '<button type="button" id="firstPage" class="turnPage first-page">首页</button>' +
		              '<button class="turnPage" id="prePage">上一页</button>' +
		              '<div class="pageWrap" style="width:' + wrapLength + 'px">' +
			             '<ul id="pageSelect" style="transition:all ' + that.options.slideSpeed + 'ms">' +
			                ulDom +
			             '</ul>' + 
		              '</div>' +
		              '<button class="turnPage" id="nextPage">下一页</button>' +
		              '<button type="button" id="lastPage" class="last-page">尾页</button>' +
		              jumpDom +
		              '<p class="total-pages">共&nbsp;' + that.options.totalPages + '&nbsp;页</p>' +
		              '<p class="total-count">' + that.options.totalCount + '</p>';
            that.el.html(content);
        },
        bindEvents: function() {
            var that = this,
                pageSelect = this.el.children('.pageWrap').children("#pageSelect"), //$('#pageSelect'), // ul
                lis = pageSelect.children(), // li的集合
                liWidth = lis[0].offsetWidth, // li的宽度
                totalPages = that.options.totalPages, // 总页数
                pageIndex = that.options.pageNo, // 当前选择的页码
                distance = 0, // ul移动距离
                prePage = this.el.children('#prePage'), //$('#prePage'),
                nextPage = this.el.children('#nextPage'),//$('#nextPage'),
                firstPage = this.el.children('#firstPage'),//$('#firstPage'),
                lastPage = this.el.children('#lastPage'),//$('#lastPage'),
                jumpBtn = this.el.children('#jumpBtn'),//$('#jumpBtn'),
                jumpText = this.el.children('#jumpText'); //$('#jumpText');

            prePage.on('click', function() {
                pageIndex--;
                if (pageIndex < 1) pageIndex = 1;
                handles(pageIndex);
            })

            nextPage.on('click', function() {
                pageIndex++;
                if (pageIndex > lis.length) pageIndex = lis.length;
                handles(pageIndex);
            })

            firstPage.on('click', function() {
                pageIndex = 1;
                handles(pageIndex);
            })

            lastPage.on('click', function() {
                pageIndex = totalPages;
                handles(pageIndex);
            })

            jumpBtn.on('click', function() {
                var jumpNum = parseInt(jumpText.val().replace(/\D/g, ''));
                if (jumpNum && jumpNum >= 1 && jumpNum <= totalPages) {
                    pageIndex = jumpNum;
                    handles(pageIndex);
                    jumpText.val(jumpNum);
                }
            })

            lis.on('click', function() {
                pageIndex = $(this).index() + 1;
                handles(pageIndex);
            })
            
            function callbackHandle(pageIndex) {
            		if(that.options.initLoad) {
            			that.options.callback(pageIndex);
            		}
            		that.options.initLoad = true;
            }

            function handles(pageIndex) {
                lis.removeClass('sel-page').eq(pageIndex - 1).addClass('sel-page');
                if (totalPages <= 5) {
                		callbackHandle(pageIndex); //that.options.callback(pageIndex);
                    return false;
                }
                if (pageIndex >= 3 && pageIndex <= totalPages - 2) distance = (pageIndex - 3) * liWidth;
                if (pageIndex == 2 || pageIndex == 1) distance = 0;
                if (pageIndex > totalPages - 2) distance = (totalPages - 5) * liWidth;
                pageSelect.css('transform', 'translateX(' + (-distance) + 'px)');
                pageIndex == 1 ? firstPage.attr('disabled', true) : firstPage.attr('disabled', false);
                pageIndex == 1 ? prePage.attr('disabled', true) : prePage.attr('disabled', false);
                pageIndex == totalPages ? lastPage.attr('disabled', true) : lastPage.attr('disabled', false);
                pageIndex == totalPages ? nextPage.attr('disabled', true) : nextPage.attr('disabled', false);
                callbackHandle(pageIndex); //that.options.callback(pageIndex);
            }
            	handles(that.options.pageNo); // 初始化页码位置
        }
    }
    $.fn.paging = function(options) {
        return new Paging($(this), options);
    }
})(jQuery, window, document);