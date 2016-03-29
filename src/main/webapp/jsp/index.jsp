<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>FileLoader Index</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <!-- JQuery, Bootstrap javascript -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.12.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

        <!--Filestyle by http://markusslima.github.io/bootstrap-filestyle/ -->
        <script src="${pageContext.request.contextPath}/js/bootstrap-filestyle.js" type="text/javascript"></script>  

        <!-- TinyMCE -->
        <script src="${pageContext.request.contextPath}/tinymce/tinymce.min.js" type="text/javascript"></script>
        <script>
            tinymce.init({
                selector: '.tmce',
                height: 300,
                width: 400,
                toolbar: 'imageButton | undo redo | styleselect | bold italic | strikethrough | alignleft | aligncenter | alignright | indent | outdent | bullist | numlist',
                setup: function (editor) {
                    editor.addButton('imageButton', {
                        text: 'Add an Image',
                        icon: false,
                        onclick: function () {
                            $(uploadModal).modal('show');
                        }
                    });
                }
            });
        </script>
        <style type="text/css">
            a {cursor:pointer;}
        </style>

    </head>
    <body>

        <div class="container">
            <h1>FileLoader</h1>
            <hr/>
            <div class="col-md-4">
                <a data-toggle="modal" data-target="#showImageModal"><span class="glyphicon glyphicon-picture"></span> See Uploaded Images</a></td>
                <textarea class='tmce'></textarea>
                <br />
            </div>
        </div>


        <!-- Start Upload Modal -->
        <div id="uploadModal" class="modal fade" role="dialog" data-backdrop="false" style="z-index: 10000; overflow-y: scroll;">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Upload Files</h4>
                    </div>

                    <div class="modal-body">
                        <div class="fileinput fileinput-new">
                            <h3>Upload a File</h3>
                            <form method="post" id="upload-form" name="upload-form" action="${pageContext.request.contextPath}/upload" enctype="multipart/form-data" class="form-horizontal">
                                <input type="file" class="filestyle" name="file" data-input="false">
                                <br />
                                <input type="submit" value="Upload" class="btn btn-default btn-file" style="margin-top: 15px;"/>
                            </form>
                        </div>
                    </div> <!-- End Body -->

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div> 

                </div> <!-- End Content -->
            </div> <!-- End Dialog -->
        </div> <!-- End Upload Modal-->

        <!-- Start Image Modal -->
        <div id="showImageModal" class="modal fade" role="dialog" data-backdrop="false">

            <div class="modal-dialog modal-lg">

                <!-- Modal content-->
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Upload Files</h4>
                    </div>

                    <table class="table table-hover">
                        <tbody>
                            <c:forEach items="${files}" var="file">
                                <tr id="file-id-${file.id}">
                                    <td>
                                        <img src="${pageContext.request.contextPath}/upload/showImage/${file.id}" style="height: 20%;" />

                                        <ul class="list-inline">

                                            <li><a data-image-id="${file.id}" class="delete-link"><span class="glyphicon glyphicon-remove"></span> delete</a></li>
                                            <li><a data-image-id="${file.id}" class="add-area-link"> <span class="glyphicon glyphicon-picture"></span> add to textarea</a></li>
                                        </ul>
                                    </td>
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>

                </div> <!-- End Modal Content -->
            </div> <!-- End Modal Dialog -->
        </div> <!-- End Image Modal -->



        <script type="text/javascript">
            var contextRoot = '${pageContext.request.contextPath}';
        </script>

        <script src="${pageContext.request.contextPath}/js/app-upload.js" type="text/javascript"></script>
    </body>
</html>

