$(function(){
    var userAgent = window.navigator.userAgent.toLowerCase();
    if(userAgent.indexOf('msie') != -1 || userAgent.indexOf('trident') != -1) {
        console.log('a');
        var file_field = document.querySelector('input[type="file"]')
        $('#img-file').on('change', function(){
            var files = $('input[type="file"]').prop('files')[0];
            $.each(this.files, function(i, file){
                var fileReader = new FileReader();
                var num = $('.item-image').length + 1 + i
                fileReader.readAsDataURL(file);
                //画像が3枚になったら超えたらドロップボックスを削除する
                if (num == 3){
                    $('#image-container').css('display', 'none')   
                }
                //読み込みが完了すると、srcにfileのURLを格納
                fileReader.onloadend = function() {
                    var src = fileReader.result
                    var html= `<div class='item-image' data-image="${file.name}">
                                <div class=' item-image__content'>
                                    <div class='item-image__content--icon'>
                                    <img src=${src} width="100" height="100" >
                                    </div>
                                </div>
                                </div>`
                    //image_box__container要素の前にhtmlを差し込む
                    $('#image-container').before(html);
                };
                $('#image-container').attr('class', `image-container-${num}`)
                $('.item-image__operetion').css('display', 'block')
            });
             
        });
        $(document).on("click", '.item-image__operetion--delete', function(){
            if (num != 3){
                $('#image-container').css('display', 'inline-block')
                $('.item-image__operetion').css('display', 'none')  
            }
            var target_image = $(".item-image__content--icon").parent().parent()
            target_image.remove()
            file_field.value = null;
            var num = $('.item-image').length
            $('#image-container').attr('class', `image-container-${num}`)
        });
    } else if(userAgent.indexOf('chrome') != -1) {
        //DataTransferオブジェクトで、データを格納する箱を作る
        var dataBox = new DataTransfer();
        var file_field = document.querySelector('input[type="file"]')
        //querySelectorでfile_fieldを取得
        //fileが選択された時に発火するイベント
        $('#img-file').on('change', function(){
            console.log('input[type="file"]')
            //選択したfileのオブジェクトをpropで取得
            var files = $('input[type="file"]').prop('files')[0];
            $.each(this.files, function(i, file){
                //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
                var fileReader = new FileReader();

                //DataTransferオブジェクトに対して、fileを追加
                dataBox.items.add(file)
                //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
                file_field.files = dataBox.files

                var num = $('.item-image').length + 1 + i
                fileReader.readAsDataURL(file);
            　　　//画像が3枚になったら超えたらドロップボックスを削除する
                if (num == 3){
                    $('#image-container').css('display', 'none')   
                }
                //読み込みが完了すると、srcにfileのURLを格納
                fileReader.onloadend = function() {
                    var src = fileReader.result
                    var html= `<div class='item-image' data-image="${file.name}">
                                <div class=' item-image__content'>
                                    <div class='item-image__content--icon'>
                                    <img src=${src} width="100" height="100" >
                                    </div>
                                </div>
                                <div class='item-image__operetion'>
                                    <div class='item-image__operetion--delete'>削除</div>
                                </div>
                                </div>`
                    //image_box__container要素の前にhtmlを差し込む
                    $('#image-container').before(html);
                };
                
                $('#image-container').attr('class', `image-container-${num}`)
            });
        });

        //削除ボタンをクリックすると発火するイベント
        $(document).on("click", '.item-image__operetion--delete', function(){
            if (num != 3){
                $('#image-container').css('display', 'inline-block')   
            }
            //削除を押されたプレビュー要素を取得
            var target_image = $(this).parent().parent()
            //削除を押されたプレビューimageのfile名を取得
            var target_name = $(target_image).data('image')
            //プレビューがひとつだけの場合、file_fieldをクリア
            if(file_field.files.length==1){
            //inputタグに入ったファイルを削除
            $('input[type=file]').val(null)
            dataBox.clearData();
            console.log(dataBox)
            }else{
                //プレビューが複数の場合
                $.each(file_field.files, function(i,input){
                    //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
                    if(input.name==target_name){
                    dataBox.items.remove(i) 
                    }
                });
                //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
                file_field.files = dataBox.files
            }
            //プレビューを削除
            target_image.remove()
            var num = $('.item-image').length
            $('#image-container').attr('class', `image-container-${num}`)
        });




        var dropArea = document.getElementById("image-container");
        dropArea.addEventListener("dragover", function(e){
            e.preventDefault();
            //ドロップエリアに影がつく
            $('#image-container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
        },false);
        //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
        dropArea.addEventListener("dragleave", function(e){
            e.preventDefault();
        　　 //ドロップエリアの影が消える
            $('#image-container').css({'border': 'none','box-shadow': 'none'})      
        },false);
        //ドラッグした要素をドロップした時に発火するイベント
        dropArea.addEventListener("drop", function(e) {
            e.preventDefault();
            $(this).children('#image-container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
            var files = e.dataTransfer.files;
            //ドラッグアンドドロップで取得したデータについて、プレビューを表示
            $.each(files, function(i,file){
            //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
            var fileReader = new FileReader();
            //dataTransferオブジェクトに値を追加
            dataBox.items.add(file)
            file_field.files = dataBox.files
            //lengthで要素の数を取得
            var num = $('.item-image').length + i + 1
            //指定されたファイルを読み込む
            fileReader.readAsDataURL(file);
            // 3枚プレビューを出したらドロップボックスが消える
            if (num == 3){
                $('#image-container').css('display', 'none')
            }
            //image fileがロードされた時に発火するイベント
            fileReader.onload = function() {
                //変数srcにresultで取得したfileの内容を代入
                var src = fileReader.result
                var html =`<div class='item-image' data-image="${file.name}">
                            <div class=' item-image__content'>
                            <div class='item-image__content--icon'>
                            <img src=${src} width="100" height="100" >
                            </div>
                            </div>
                            <div class='item-image__operetion'>
                            <div class='item-image__operetion--delete'>削除</div>
                            </div>
                        </div>`
            //image-box__containerの前にhtmlオブジェクトを追加　
            $('#image-container').before(html);
            };
            //image-box__containerにitem-num-(変数)という名前のクラスを追加する
            $('#image-container').attr('class', `image-container-${num}`)
            })
        })
    }else if(userAgent.indexOf('safari') != -1) {
        console.log('safari');
        var file_field = document.querySelector('input[type="file"]')
        $('#img-file').on('change', function(){
            var files = $('input[type="file"]').prop('files')[0];
            $.each(this.files, function(i, file){
                var fileReader = new FileReader();
                var num = $('.item-image').length + 1 + i
                fileReader.readAsDataURL(file);
                //画像が3枚になったら超えたらドロップボックスを削除する
                if (num == 3){
                    $('#image-container').css('display', 'none')   
                }
                //読み込みが完了すると、srcにfileのURLを格納
                fileReader.onloadend = function() {
                    var src = fileReader.result
                    var html= `<div class='item-image' data-image="${file.name}">
                                <div class=' item-image__content'>
                                    <div class='item-image__content--icon'>
                                    <img src=${src} width="100" height="100" >
                                    </div>
                                </div>
                                </div>`
                    //image_box__container要素の前にhtmlを差し込む
                    $('#image-container').before(html);
                };
                $('#image-container').attr('class', `image-container-${num}`)
                $('.item-image__operetion').css('display', 'block')
            });
                
        });
        $(document).on("click", '.item-image__operetion--delete', function(){
            if (num != 3){
                $('#image-container').css('display', 'inline-block')
                $('.item-image__operetion').css('display', 'none')  
            }
            var target_image = $(".item-image__content--icon").parent().parent()
            target_image.remove()
            file_field.value = null;
            var num = $('.item-image').length
            $('#image-container').attr('class', `image-container-${num}`)
        });
    }else {
        //DataTransferオブジェクトで、データを格納する箱を作る
        var dataBox = new DataTransfer();
        var file_field = document.querySelector('input[type="file"]')
        //querySelectorでfile_fieldを取得
        //fileが選択された時に発火するイベント
        $('#img-file').on('change', function(){
            console.log('input[type="file"]')
            //選択したfileのオブジェクトをpropで取得
            var files = $('input[type="file"]').prop('files')[0];
            $.each(this.files, function(i, file){
                //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
                var fileReader = new FileReader();

                //DataTransferオブジェクトに対して、fileを追加
                dataBox.items.add(file)
                //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に代入
                file_field.files = dataBox.files

                var num = $('.item-image').length + 1 + i
                fileReader.readAsDataURL(file);
            　　　//画像が3枚になったら超えたらドロップボックスを削除する
                if (num == 3){
                    $('#image-container').css('display', 'none')   
                }
                //読み込みが完了すると、srcにfileのURLを格納
                fileReader.onloadend = function() {
                    var src = fileReader.result
                    var html= `<div class='item-image' data-image="${file.name}">
                                <div class=' item-image__content'>
                                    <div class='item-image__content--icon'>
                                    <img src=${src} width="100" height="100" >
                                    </div>
                                </div>
                                <div class='item-image__operetion'>
                                    <div class='item-image__operetion--delete'>削除</div>
                                </div>
                                </div>`
                    //image_box__container要素の前にhtmlを差し込む
                    $('#image-container').before(html);
                };
                
                $('#image-container').attr('class', `image-container-${num}`)
            });
        });

        //削除ボタンをクリックすると発火するイベント
        $(document).on("click", '.item-image__operetion--delete', function(){
            if (num != 3){
                $('#image-container').css('display', 'inline-block')   
            }
            //削除を押されたプレビュー要素を取得
            var target_image = $(this).parent().parent()
            //削除を押されたプレビューimageのfile名を取得
            var target_name = $(target_image).data('image')
            //プレビューがひとつだけの場合、file_fieldをクリア
            if(file_field.files.length==1){
            //inputタグに入ったファイルを削除
            $('input[type=file]').val(null)
            dataBox.clearData();
            console.log(dataBox)
            }else{
                //プレビューが複数の場合
                $.each(file_field.files, function(i,input){
                    //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
                    if(input.name==target_name){
                    dataBox.items.remove(i) 
                    }
                });
                //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
                file_field.files = dataBox.files
            }
            //プレビューを削除
            target_image.remove()
            var num = $('.item-image').length
            $('#image-container').attr('class', `image-container-${num}`)
        });




        var dropArea = document.getElementById("image-container");
        dropArea.addEventListener("dragover", function(e){
            e.preventDefault();
            //ドロップエリアに影がつく
            $('#image-container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
        },false);
        //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
        dropArea.addEventListener("dragleave", function(e){
            e.preventDefault();
        　　 //ドロップエリアの影が消える
            $('#image-container').css({'border': 'none','box-shadow': 'none'})      
        },false);
        //ドラッグした要素をドロップした時に発火するイベント
        dropArea.addEventListener("drop", function(e) {
            e.preventDefault();
            $(this).children('#image-container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
            var files = e.dataTransfer.files;
            //ドラッグアンドドロップで取得したデータについて、プレビューを表示
            $.each(files, function(i,file){
            //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
            var fileReader = new FileReader();
            //dataTransferオブジェクトに値を追加
            dataBox.items.add(file)
            file_field.files = dataBox.files
            //lengthで要素の数を取得
            var num = $('.item-image').length + i + 1
            //指定されたファイルを読み込む
            fileReader.readAsDataURL(file);
            // 3枚プレビューを出したらドロップボックスが消える
            if (num == 3){
                $('#image-container').css('display', 'none')
            }
            //image fileがロードされた時に発火するイベント
            fileReader.onload = function() {
                //変数srcにresultで取得したfileの内容を代入
                var src = fileReader.result
                var html =`<div class='item-image' data-image="${file.name}">
                            <div class=' item-image__content'>
                            <div class='item-image__content--icon'>
                            <img src=${src} width="100" height="100" >
                            </div>
                            </div>
                            <div class='item-image__operetion'>
                            <div class='item-image__operetion--delete'>削除</div>
                            </div>
                        </div>`
            //image-box__containerの前にhtmlオブジェクトを追加　
            $('#image-container').before(html);
            };
            //image-box__containerにitem-num-(変数)という名前のクラスを追加する
            $('#image-container').attr('class', `image-container-${num}`)
            })
        })
    }
});

    