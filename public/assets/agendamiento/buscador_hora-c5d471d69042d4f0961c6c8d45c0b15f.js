function cargarMotivos(){$("select.select_especialidad").select2({width:"80%",placeholder:"Seleccione una especialidad",allowClear:!0}),$("select.select_especialista").select2({width:"80%",placeholder:"Seleccione un especialista",allowClear:!0}),$("input[type=radio][name^=radios-motivo-]").change(function(){var e=$(this).attr("name").substring(14),a=$("#m_c_"+e).find("input[name=radios-motivo-"+e+"]:checked").val();return"1"==a?($("#div-sel-ant-"+e).hide(),$("#div-sel-cap-"+e).show()):($("#div-sel-ant-"+e).show(),$("#div-sel-ant-"+e).length?$("#div-sel-cap-"+e).hide():$("#div-sel-cap-"+e).show()),a})}function actualizarCentro(){var e=new Array,a=document.getElementById("checkbox_centros");if(null!=a)for(var o=a.getElementsByTagName("input"),t=1;t<o.length;t++)o[t].checked&&e.push(o[t].value);var r=$("#select_especialidad").val(),i=$("#select_especialista").val();(""!=r||""!=i)&&($("#select_especialista").prop("disabled",!0),$.ajax({type:"POST",url:"/buscar_horas",data:{centros:e,especialidad:r,especialista:i},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e),$("#select_especialista").prop("disabled",!1),$("#cargando-especialistas").html("")},error:function(){alert("Error al filtrar por especialidad.4")}}))}function actualizarTodosLosCentros(){var e=document.getElementById("parentCheckBox");if(e.checked){{$("#select_especialidad option").attr("disabled",!1),$("#select_especialista option").attr("disabled",!1)}actualizarCentro()}else{{$("#select_especialidad option").attr("disabled",!0),$("#select_especialista option").attr("disabled",!0)}$("#select_especialidad").val(""),$("#select_especialista").val(""),$("#buscadorHora").fullCalendar("removeEvents")}}$("#iconos-leyenda").length>0&&$.ajax({type:"POST",url:"/buscar_horas_profesional",data:{},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("Error al filtrar por especialidad.2")}}),$(document).ready(function(){$("select.select_especialidad").select2({width:"80%",placeholder:"Seleccione una especialidad",allowClear:!0}),$("select.select_especialista").select2({width:"80%",placeholder:"Seleccione un especialista",allowClear:!0})}),$("#select_especialidad").on("change",function(){var e=$("#select_especialidad").val();""!=e&&addLittleSpinner("cargando-especialistas"),$("#select_especialista").val(""),$.ajax({type:"POST",url:"/filtrar_profesionales",data:{especialidad:e},success:function(e){$("#select_especialista").val(""),$("#select_especialista").empty();$("#select_especialista").append(e)},error:function(){alert("Error al filtrar por especialidad.3")}}),$("#buscadorHora").fullCalendar("removeEvents"),actualizarCentro()}),$("#select_especialista").on("change",function(){$("#select_especialista").val();$("#buscadorHora").fullCalendar("removeEvents"),actualizarCentro()}),$("#buscadorHora").fullCalendar({header:{left:"prev,next today",center:"title",right:"month,agendaWeek,agendaDay"},lang:"es",allDaySlot:!1,slotMinutes:30,minTime:"08:00:00",maxTime:"20:00:00",height:"auto",selectable:!0,buttonText:{today:"Hoy",month:"Mes",week:"Semana",day:"D\xeda"},firstDay:1,editable:!1,defaultView:"agendaWeek",axisFormat:"H:mm",eventRender:function(e,a){a.qtip({content:{text:e.description,title:e.custom},style:{classes:"qtip-bootstrap"},position:{viewport:$(window)}})},eventAfterRender:function(e,a){var o=a.find("span"),t=a.find(".fc-time");t.attr("data-start",o.text())},eventClick:function(e){$.ajax({type:"POST",url:"/aux/detalleEvento",data:{agendamiento_id:e.id},success:function(a){$("#modal-content").html(a),$("#modal-container").modal("show"),motivo=cargarMotivos(),$("#modal-content .modal-footer .cancelar-hora").click(function(){$.ajax({type:"POST",url:"/aux/cancelarHora",data:{agendamiento_id:e.id},success:function(a){id=e.id,$("#buscadorHora").fullCalendar("removeEvents",id),"1"==a?$("#modal-container").modal("hide"):alert("No se puede cancelar la hora"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})}),$("#modal-content .modal-footer .bloquear-hora").click(function(){$.ajax({type:"POST",url:"/bloquear_hora",data:{agendamiento_id:e.id},success:function(a){id=e.id,$("#buscadorHora").fullCalendar("removeEvents",id),"1"==a?$("#modal-container").modal("hide"):alert("No se pudo bloquear la hora"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("Hubo un problema al bloquear la hora de atenci\xf3n.")}})},error:function(){alert("No se pudo bloquear la hora de atenci\xf3n.")}})}),$("#modal-content .modal-footer .desbloquear-hora").click(function(){$.ajax({type:"POST",url:"/desbloquear_hora",data:{agendamiento_id:e.id},success:function(a){id=e.id,$("#buscadorHora").fullCalendar("removeEvents",id),"1"==a?$("#modal-container").modal("hide"):alert("No se pudo desbloquear la hora"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("Hubo un problema al desbloquear la hora de atenci\xf3n.")}})},error:function(){alert("No se pudo desbloquear la hora de atenci\xf3n.")}})}),$("#modal-content .modal-footer .confirmar-hora").click(function(){$.ajax({type:"POST",url:"/aux/confirmarHora",data:{agendamiento_id:e.id},success:function(a){id=e.id,$("#buscadorHora").fullCalendar("removeEvents",id),"1"==a?$("#modal-container").modal("hide"):alert("No se puede confirmar la hora"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})}),$("#modal-content .modal-footer .marcar-llegada").click(function(){$.ajax({type:"POST",url:"/aux/marcarLlegada",data:{agendamiento_id:e.id},success:function(a){id=e.id,$("#buscadorHora").fullCalendar("removeEvents",id),"1"==a?$("#modal-container").modal("hide"):alert("No se puede confirmar la hora"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})}),$("#modal-content .modal-footer .pedir-hora").click(function(){id_agend=e.id,m_c=$("#m_c_"+id_agend).find("input[name=radios-motivo-"+id_agend+"]:checked").val(),s_m=$("#select-antecedente-"+id_agend).val(),s_c=$("#select-capitulo-"+id_agend).val(),s_p=$("#select-paciente-"+id_agend).val(),s_ph=$("#select-persona-hora-"+id_agend).val(),""==s_p||""==s_ph?alert("Selecciona una persona para asignar la hora."):$.ajax({type:"POST",url:"/aux/pedirHoraEvento",data:{agendamiento_id:id_agend,motivo:m_c,antecedente:s_m,capitulo_cie_10:s_c,paciente:s_p,persona_hora:s_ph},success:function(e){$("#buscadorHora").fullCalendar("removeEvents",id_agend),"1"==e?$("#modal-container").modal("hide"):alert("La hora ya fue tomada"),$.ajax({type:"POST",url:"/aux/mostrarEventos",data:{evento_id:id_agend,especialidad_id:especialidad_id,profesional_id:profesional_id,prestador_id:prestador_id},success:function(e){$("#buscadorHora").fullCalendar("addEventSource",e)},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})})},error:function(){alert("No se pudieron cargar las horas de atenci\xf3n")}})}}),$(document).ready(function(){$("fieldset").each(function(){var e=$(this).find("input.childCheckBox"),a=e.filter(":checked").length;e.length==a&&$(this).find(".parentCheckBox").prop("checked",!0)}),$("input.childCheckBox").change(function(){$(this).closest("fieldset").find(".parentCheckBox").prop("checked",$(this).closest(".content").find(".childCheckBox:checked").length===$(this).closest(".content").find(".childCheckBox").length)}),$(".parentCheckBox").click(function(){$(this).parents("fieldset:eq(0)").find(".childCheckBox").prop("checked",this.checked)}),$(".childCheckBox").click(function(){if(1==$(this).parents("fieldset:eq(0)").find(".parentCheckBox").attr("checked")&&0==this.checked&&$(this).parents("fieldset:eq(0)").find(".parentCheckBox").attr("checked",!1),1==this.checked){var e=!0;$(this).parents("fieldset:eq(0)").find(".childCheckBox").each(function(){0==this.checked&&(e=!1)}),$(this).parents("fieldset:eq(0)").find(".parentCheckBox").attr("checked",e)}})}),$("#nav-antecedentes").on("shown.bs.tab",function(e){var a=$(e.target).attr("href");("#agenda"==a||"#horas"==a)&&jQuery("#buscadorHora").fullCalendar("render")});