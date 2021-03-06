<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--包含头部文件-->
<%@include file="../public/header.jsp"%>
<div class="cl pd-5 bg-1 bk-gray mt-20"> 新建文章</div>
<div>${message}<div>
<article class="page-container">
	<form class="form form-horizontal" id="form-article-add" method="post" action="${path}add">
	基本信息：
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" class="input-text" value="${article.title}" placeholder="" id="" name="title">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>所属分类：</label>
			<div class="formControls col-xs-8 col-sm-3"> <span class="select-box">
				<select name="category_id" class="select categoryId">
					<option value="0">请选择一个分类</option>
					<c:forEach var="cate" items="${requestScope.catelist}">
					<option value="${cate.id}"> -${cate.name}</option>
					</c:forEach>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">所属子类：</label>
			<div class="formControls col-xs-8 col-sm-3"> <span class="select-box">
				<select name="kid_id" class="select se_categoryId">
					<option value="0">---------</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">作者：</label>
			<div class="formControls col-xs-8 col-sm-3">
				<input type="text" class="input-text" value="${article.author}" placeholder="" id="" name="author">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea class="input-text" style="width:65%;height:200px;resize:none;" name="context" >${article.context}</textarea> 
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章正文 ：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<script id="editor2"  type="text/plain" name="text" style="width:80%;height:300px;">${article.text}</script> 
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 添加</button>	
			</div>
		</div>
	</form>
</article>
<script>
/**定义页面全局变量**/
var SCOPE = {
	"city_url" : "{:url('api/city/getCitysByParentId')}",
	"category_url" : "${path}getchlidcategory",
	"uploadify_swf" : "/static/admin/uploadify/uploadify.swf",
    "image_upload" : "'image/upload'",
};

</script>
<!--包含头部文件-->
<%@include file="../public/footer.jsp"%>
<script type="text/javascript" src="/static/manage/admin/hui/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="/static/manage/admin/hui/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="/static/manage/admin/hui/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script src="/static/manage/admin/hui/lib/My97DatePicker/WdatePicker.js"></script>
<script>
$(function(){
	var ue = UE.getEditor('editor');
	var ue = UE.getEditor('editor2');
});
</script>
</body>
</html>