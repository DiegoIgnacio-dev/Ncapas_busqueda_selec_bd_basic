<script>
    //esto buscara la informacion atraves de una consulta ajax y rellenara un select desde la ase de datos
        var Mx_Seccion = [
    {
        "ID_RLS_LS": 0,
        "RLS_LS_DESC": 0
    }
        ];
        function Ajax_Seccion() {
            modal_show();

            $(".block_wait").fadeIn(500);
            $.ajax({
                "type": "POST",
                "url": "Chk_Est_Seccion.aspx/Llenar_Ddl_Seccion",
                //"data": Data_Par,
                "contentType": "application/json;  charset=utf-8",
                "dataType": "json",
                "success": function (response) {
                    var json_receiver = response.d;
                    if (json_receiver != "null") {
                        Mx_Seccion = JSON.parse(json_receiver);
                        Fill_Ddl_Seccion();
                        Hide_Modal();

                    } else {

                        Hide_Modal();
                        $("#mError_AAH h4").text("Sin resultados");
                        $("#mError_AAH button").attr("class", "btn btn-danger");
                        $("#mError_AAH p").text("No se han encontrado resultados");
                        $("#mError_AAH").modal();
                    }
                    $(".block_wait").fadeOut(500);
                },
                "error": function (response) {
                    var str_Error = response.responseJSON.ExceptionType + "\n \n";
                    str_Error = response.responseJSON.Message;
                    alert(str_Error);

                }
            });
        }
</script>