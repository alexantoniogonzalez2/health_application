puts 'Problemas Salud AUGE'
problemas_salud_auge_list = [
	['Enfermedad renal crónica etapa 4 y 5','','','2005-07-01'],
	['Cardiopatías Congénitas Operables en menores de 15 años','','15','2005-07-01'],
	['Cáncer Cérvicouterino','15','','2005-07-01'],
	['Alivio del dolor y cuidados paliativos por cáncer avanzado','','','2005-07-01'],
	['Infarto Agudo del Miocardio','','','2005-07-01'],
	['Diabetes Mellitus Tipo 1','','','2005-07-01'],
	['Diabetes Mellitus Tipo 2','','','2005-07-01'],
	['Cáncer de Mama en personas de 15 años y más','15','','2005-07-01'],
	['Disrafias Espinales','','','2005-07-01'],
	['Tratamiento Quirúrgico de Escoliosis en personas menores de 25 años','','24','2005-07-01'],
	['Tratamiento Quirúrgico de Cataratas','','','2005-07-01'],
	['Endoprotesis Total de Cadera en personas de 65 años y más con Artrosis de Cadera con Limitación Funcional Severa','65','','2005-07-01'],
	['Fisura Labiopalatina','','','2005-07-01'],
	['Cáncer en personas menores de 15 años','','14','2005-07-01'],
	['Esquizofrenia','','','2005-07-01'],
	['Cáncer de Testículo en personas de 15 años y más','15','','2005-07-01'],
	['Linfomas en personas de 15 años y más','15','','2005-07-01'],
	['Síndrome de la Inmunodeficiencia Adquirida VIH/SIDA','','','2005-07-01'],
	['Infección Respiratoria Aguda (IRA) de manejo ambulatorio en personas menores de 5 años','','4','2005-07-01'],
	['Neumonía Adquirida en la Comunidad de manejo ambulatorio en personas de 65 años y más','65','','2005-07-01'],
	['Hipertensión Arterial Primaria o Esencial en personas de 15 años y más','15','','2005-07-01'],
	['Epilepsia No Refractaria en personas desde 1 año y menores de 15 años','1','14','2005-07-01'],
	['Salud Oral Integral para niños y niñas de 6 años','6','6','2005-07-01'],
	['Prevención de Parto Prematuro','','','2005-07-01'],
	['Trastornos de Generación del Impulso y Conducción en personas de 15 años y más, que requieren marcapaso','15','','2005-07-01'],
	['Colecistectomía Preventiva del Cáncer de Vesícula en personas de 35 a 49 años','35','49','2006-07-01'],
	['Cáncer Gástrico','15','','2006-07-01'],
	['Cáncer de Próstata en personas de 15 años y más','15','','2006-07-01'],
	['Vicios de Refracción en personas de 65 años y más','65','','2006-07-01'],
	['Estrabismo en personas menores de 9 años','','','2006-07-01'],
	['Retinopatía Diabética','','','2006-07-01'],
	['Desprendimiento de Retina Regmatógeno no traumático','','','2006-07-01'],
	['Hemofilia','','','2006-07-01'],
	['Depresión en personas de 15 años y más','15','','2006-07-01'],
	['Tratamiento de la Hiperplasia Benigna de la Próstata en personas sintomáticas','','','2006-07-01'],
	['Órtesis (o ayudas técnicas) para personas de 65 años y más','65','','2006-07-01'],
	['Accidente Cerebrovascular Isquémico en personas de 15 Años y más','15','','2006-07-01'],
	['Enfermedad Pulmonar Obstructiva Crónica de tratamiento ambulatorio','','','2006-07-01'],
	['Asma Bronquial Moderada y Grave en menores de 15 años','','14','2006-07-01'],
	['Síndrome de Dificultad Respiratoria en el Recién Nacido','','','2006-07-01'],
	['Tratamiento médico en personas de 55 años y más con artrosis de cadera y/o rodilla, leve o moderada','55','','2007-07-01'],
	['Hemorragia subaracnoidea secundaria a ruptura de aneurismas cerebrales','','','2007-07-01'],
	['Tumores primarios del sistema nervioso central en personas de 15 años o más.','15','','2007-07-01'],
	['Tratamiento quirúrgico de hernia del núcleo pulposo lumbar','','','2007-07-01'],
	['Leucemia en personas de 15 años y más','15','','2007-07-01'],
	['Urgencia odontológica ambulatoria','','','2007-07-01'],
	['Salud oral integral del adulto de 60 años','60','60','2007-07-01'],
	['Politraumatizado grave','','','2007-07-01'],
	['Traumatismo cráneo encefálico moderado o grave','','','2007-07-01'],
	['Trauma ocular grave','','','2007-07-01'],
	['Fibrosis Quística','','','2007-07-01'],
	['Artritis reumatoidea','15','','2007-07-01'],
	['Consumo perjudicial o dependencia de riesgo bajo a moderado de alcohol y drogas en personas menores de 20 años','','19','2007-07-01'],
	['Analgesia del parto','','','2007-07-01'],
	['Gran quemado','','','2007-07-01'],
	['Hipoacusia bilateral en personas de 65 años y más que requieren uso de audífono','65','','2007-07-01'],
	['Retinopatía del prematuro','','','2010-07-01'],
	['Displasia broncopulmonar del prematuro','','','2010-07-01'],
	['Hipoacusia neurosensorial bilateral del prematuro','','','2010-07-01'],
	['Epilepsia no refractaria en personas de 15 años y más','15','','2010-07-01'],
	['Asma bronquial en personas de 15 años y más','15','','2010-07-01'],
	['Enfermedad de parkinson','','','2010-07-01'],
	['Artritis idiopática juvenil','','17','2010-07-01'],
	['Prevencion secundaria enfermedad renal crónica terminal','15','','2010-07-01'],
	['Displasia luxante de caderas','','0','2010-07-01'],
	['Salud oral integral de la embarazada','','','2010-07-01'],
	['Esclerosis múltiple remitente recurrente','','','2010-07-01'],
	['Hepatitis crónica por virus hepatitis B','','','2010-07-01'],
	['Hepatitis C','','','2010-07-01'],
	['Cáncer colorectal en personas de 15 años y más','15','','2013-07-01'],
	['Cáncer de ovario epitelial','15','','2013-07-01'],
	['Cáncer vesical en personas de 15 años y más','15','','2013-07-01'],
	['Osteosarcoma en personas de 15 años y más','15','','2013-07-01'],
	['Tratamiento quirúrgico de lesiones crónicas de la válvula aórtica en personas de 15 años y más','15','','2013-07-01'],
	['Trastorno bipolar en personas de 15 años y más','15','','2013-07-01'],
	['Hipotiroidismo en personas de 15 años y más','','','2013-07-01'],
	['Tratamiento de hipoacusia moderada en menores de 2 años','','1','2013-07-01'],
	['Lupus eritematoso sistémico','','','2013-07-01'],
	['Tratamiento quirúrgico de lesiones crónicas de las válvulas mitral y tricúspide en personas de 15 años y más','15','','2013-07-01'],
	['Tratamiento de erradicación del helicobacter pylori','','','2013-07-01'],

]

ActiveRecord::Base.transaction do
	problemas_salud_auge_list.each do |nombre, edad_desde, edad_hasta, fecha_inicio_auge|
	  MedProblemasSaludAuge.create! nombre: nombre, edad_desde: edad_desde, edad_hasta: edad_hasta, fecha_inicio_auge: fecha_inicio_auge
	end
end	