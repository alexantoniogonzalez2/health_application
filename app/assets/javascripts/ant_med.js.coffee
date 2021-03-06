$('#select_medicamento_ant').select2
  width: '380px'
  minimumInputLength: 3
  placeholder: 'Selecciona un medicamento'
  ajax:
    url: '/cargar_medicamentos'
    dataType: 'json'
    type: 'POST'
    data: (params) ->
      { q: params.term }
    processResults: (data, page) ->
      { results: data }

$('#select_medicamento_ant').on 'change', (e) ->
  value = $('#select_medicamento_ant').val()
  if typeof atencion_salud_id != 'undefined'
    at_salud_id = atencion_salud_id
  else
    at_salud_id = 'persona'
  $.ajax
    type: 'POST'
    url: '/agregar_medicamento_ant'
    data:
      medicamento_id: value
      atencion_salud_id: at_salud_id
    error: (jqXHR, textStatus, errorThrown) ->       
    success: (data, textStatus, jqXHR) -> $('#med').addClass 'active-ant' if $('#lista-medicamentos tr').length > 0