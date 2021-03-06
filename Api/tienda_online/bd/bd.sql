BEGIN;
CREATE TABLE public.Orders
(
    id integer NOT NULL,
    product_id integer NOT NULL,
    adres_id integer NOT NULL,
    user_phone_number character varying(200) NOT NULL,
    delivery_date date NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.Products
(
    id integer NOT NULL,
    name character varying(500) NOT NULL,
	presentation text NOT NULL,
    description text NOT NULL,
	posology text NOT NULL,
	management text NOT NULL,
    stock_code character varying(100) NOT NULL,
    category_id integer NOT NULL,
    inventory_id integer NOT NULL,
    price double precision NOT NULL,
    discount_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.Users
(
    id integer NOT NULL,
    user_name character varying(25) NOT NULL,
    password character varying(25) NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    phone_number character varying(20) NOT NULL,
	email varchar(50) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.discount
(
    id integer NOT NULL,
    discount double precision NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.inventory
(
    id integer NOT NULL,
    quantity integer NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.order_destails
(
    id integer NOT NULL,
    product_id integer NOT NULL,
	quantity integer NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.product_category
(
    id integer NOT NULL,
    name character varying(100),
    description character varying(250),
    PRIMARY KEY (id)
);
CREATE TABLE public.user_address
(
    id integer NOT NULL,
    user_id integer NOT NULL,
    adres_line1 character varying(200) NOT NULL,
    adres_line2 character varying(100) NOT NULL,
    zipcode char NOT NULL,
    country name NOT NULL,
    phone integer NOT NULL,
	email integer NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE public.user_payment
(
    id integer NOT NULL,
    user_id integer NOT NULL,
    payment_type character varying(200) NOT NULL,
    provider character varying(200) NOT NULL,
    account_no character varying(200) NOT NULL,
    payment_date date NOT NULL,
    payment_detail character varying(500) NOT NULL,
    PRIMARY KEY (id)
);
ALTER TABLE public.Orders
    ADD FOREIGN KEY (adres_id)
    REFERENCES public.user_address (id)
    NOT VALID;


ALTER TABLE public.Orders
    ADD FOREIGN KEY (product_id)
    REFERENCES public.Products (id)
    NOT VALID;


ALTER TABLE public.Products
    ADD FOREIGN KEY (category_id)
    REFERENCES public.product_category (id)
    NOT VALID;


ALTER TABLE public.Products
    ADD FOREIGN KEY (category_id)
    REFERENCES public.product_category (id)
    NOT VALID;


ALTER TABLE public.Products
    ADD FOREIGN KEY (discount_id)
    REFERENCES public.discount (id)
    NOT VALID;


ALTER TABLE public.Products
    ADD FOREIGN KEY (inventory_id)
    REFERENCES public.inventory (id)
    NOT VALID;


ALTER TABLE public.order_destails
    ADD FOREIGN KEY (product_id)
    REFERENCES public.Products (id)
    NOT VALID;


ALTER TABLE public.user_address
    ADD FOREIGN KEY (user_id)
    REFERENCES public.Users (id)
    NOT VALID;


ALTER TABLE public.user_payment
    ADD FOREIGN KEY (user_id)
    REFERENCES public.Users (id)
    NOT VALID;


ALTER TABLE public.user_payment
    ADD FOREIGN KEY (user_id)
    REFERENCES public.Users (id)
    NOT VALID;
insert into discount(id,discount) values(1,10);
insert into discount(id,discount) values(2,10);
insert into discount(id,discount) values(3,10);
insert into discount(id,discount) values(4,10);
insert into discount(id,discount) values(5,10);
insert into discount(id,discount) values(6,10);
insert into discount(id,discount) values(7,10);
insert into discount(id,discount) values(8,10);
insert into discount(id,discount) values(9,10);
insert into discount(id,discount) values(10,10);


insert into inventory(id,quantity) values(1,100);
insert into inventory(id,quantity) values(2,500);
insert into inventory(id,quantity) values(3,110);
insert into inventory(id,quantity) values(4,120);
insert into inventory(id,quantity) values(5,130);
insert into inventory(id,quantity) values(6,140);
insert into inventory(id,quantity) values(7,150);
insert into inventory(id,quantity) values(8,1000);
insert into inventory(id,quantity) values(9,2210);
insert into inventory(id,quantity) values(10,7810);

insert into product_category(id,name,description) 
values(10,'MEDICINA FARMAC??UTICA','SON MEDICAMENTOS CON FABRICACI??N, 
		PREPARACI??N, UNI??N DE PRODUCTOS QU??MICOS MEDICINALES PARA EL 
	 TRATAMIENTO Y TAMBI??N LA PREVENCI??N DE LAS ENFERMEDADES.');
	 
	 
insert into product_category(id,name,description) 
values(20,'MEDICINA NATURAL Y TRADICIONAL','MODO DE CURACI??N DE 
	   ENFERMEDADES Y MEJORA DE LA SALUD QUE PERMITE ABRIRTE A OTRAS 
	OPCIONES, DAR??N EXPERIENCIAS QUE AYUDAN AL CUERPO HACIA UNA 
		VIDA CON MAYOR CALIDAD.');

Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(1,'NEOBOL SPRAY','ENVASE DE 30 GRAMO','INDICADO EN ENFERMEDADES DE LA PIEL Y MUCOSAS COMO: INFECCIONES EN LA PIEL, ??LCERA CUT??NEA, 
	   QUEMADURAS, HERIDAS Y DERMATOSIS2, 3.','APLICAR UNA FINA CAPA DEL PRODUCTO SOBRE LA LESI??N 1 ?? 2 VECES POR D??A. 
	   LA REGI??N PUEDE CUBRIRSE CON UNA GASA EST??RIL.','T??PICA',100,10,2,95.00,1);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(2,'WINASORB JARABE','BOTELLA DE 60 ML Y 120 ML CON VASO DOSIFICADOR. SABOR A FRAMBUESA.','WINASORB NI??OS JARABE PROVEE UN ALIVIO R??PIDO Y EFECTIVO DE: FIEBRE, DOLOR DE CABEZA ASOCIADO 
	   CON LA DENTICI??N, Y DOLOR Y FIEBRE ASOCIADO A LA VACUNACI??N.','SI EL NI??O PESA MENOS DE 11 KG O EST?? POR DEBAJO DE 
	   LOS 2 A??OS DE EDAD, CONSULTE WINASORB BEB?? GOTAS O CONSULTE A SU M??DICO ACERCA DE C??MO AJUSTAR LA DOSIS.','ADMINISTRE 
	   DIRECTAMENTE EN LA BOCA DEL NI??O CON LA COPA DOSIFICADORA.',101,10,2,40.00,2);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(3,'SERTAL COMPUESTO','COMPRIMIDOS','DOLOR LEVE A MODERADO ASOCIADO A DISMENORREA PRIMARIA Y ESTADOS ESPASM??DICOS DEL INTESTINO EN 
	   ADULTOS Y NI??OS MAYORES DE 12 A??OS DE EDAD. TAMBI??N EST?? INDICADO EN EL TRATAMIENTO DEL C??LICO RENAL (URETERAL).','1 
	   A 4 DOSIS DIARIAS, INDISTINTAMENTE INYECTADAS POR V??A INTRAMUSCULAR O INTRAVENOSA (LENTA). EN CASO NECESARIO PUEDEN 
	   INYECTARSE 2 DOSIS JUNTAS, SIN INCONVENIENTE ALGUNO. LA INYECCI??N INTRAVENOSA DEBE EFECTUARSE DIRECTAMENTE EN BOLO 
	   (LENTA) Y NO UTILIZANDO TUBULADURA DE PERFUSI??N.','V??A DE ADMINISTRACI??N: INYECCI??N INTRAVENOSA.',103,10,3,55.00,3);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(4,'REUNETAN','CREMA DE 100 G.',' ANTIINFLAMATORIO NO ESTEROIDEO. POSEE PROPIEDADES ANTIINFLAMATORIAS, ANALG??SICAS Y ANTIPIR??TICAS. SUS 
	   EFECTOS ANTIINFLAMATORIOS SE MANIFIESTAN EN PACIENTES CON ARTRITIS REUMATOIDE Y TRASTORNOS SIMILARES.','APLICAR DIRECTAMENTE 
	   EN EL ??REA AFECTADA EN CANTIDAD SUFICIENTE Y FR??TESE DE 1 A 2 MINUTOS. HACER DE DOS A TRES APLICACIONES DIARIAS, O UNA ANTES 
	   DE CADA ACTIVIDAD DEPORTIVA. NO EXCEDER DE 4 APLICACIONES POR D??A.','T??PICA',104,10,4,45.00,4);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(5,'BUDESONIDA INHALADOR','ENVASE A PRESI??N DE 10ML','TRATAMIENTO DEL ASMA BRONQUIAL, EN PACIENTES QUE PREVIAMENTE NO HAYAN RESPONDIDO A TERAPIA CON 
	   BRONCODILATADORES Y/O ANTIAL??RGICOS.','1 INHAL. 2 VECES/D??A (MA??ANA/TARDE). ASMA GRAVE: 1-2 INHAL. 4 VECES/D??A. NI??OS > 7 
	   A??OS: 200-800 MCG/D??A; DE 2 A 7 A??OS: 200-400 MCG/D??A EN 2-4 ADMINISTRACIONES.','ORAL',105,10,5,125.00,5);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(6,'VICK MIEL','ENVASE A PRESI??N DE 10ML','TRATAMIENTO DEL ASMA BRONQUIAL, EN PACIENTES QUE PREVIAMENTE NO HAYAN RESPONDIDO A TERAPIA CON BRONCODILATADORES 
	   Y/O ANTIAL??RGICOS.','NI??OS DE 2-7 A??OS: 200-400 MCG DIARIOS, DIVIDIDOS EN 2-4 ADMINISTRACIONES. NI??OS A PARTIR DE 7 A??OS: 200-800 
	   MCG DIARIOS, DIVIDIDOS EN 2-4 ADMINISTRACIONES. ADULTOS: 200-1600 MCG DIARIOS, DIVIDIDOS EN 2-4 ADMINISTRACIONES.','ORAL',106,10,
	   6,75.00,6);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(7,'VITA BALANCE KIDS','ENVASE DE 150 GOMITAS','FUSI??N DE VITAMINAS ESENCIALES, MINERALES Y SABORES DE FRUTAS NATURALES EN UNA DELICIOSA GOMITA.','1 
	   ADMINISTRACI??N DIARIA','ORAL',107,10,7,100.00,7);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(8,'DEKA-C JARABE','JARABE DE 240ML','REFUERZO A NIVEL BRONCOPULMONAR, PREVENTIVO EN CASOS DE GRIPE Y RESFRIADOS. DISMINUYE LA FRECUENCIA, INTENSIDAD 
	   Y DURACI??N DE LOS RESFRIADOS Y ESTADOS GRIPALES.','1 A 2 CUCHARADAS AL D??A DURANTE 3 D??AS','ORAL',108,10,8,85.00,8);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(9,'DOLO NEUROBION','ENVASE DE 10 TABLETAS','DOLORES PROVOCADOS POR GOLPES, TORCEDURAS Y CA??DAS, DOLOR DE ESPALDA BAJA, CUELLO Y AQUELLOS CAUSADOS POR 
	   CONTRACTURAS O MALA POSTURA.','UNA TABLETA CADA 12 HRS DE PREFERENCIA CON ALIMENTO, SIN SOBREPASAR LA DOSIS DIARIA M??XIMA DE 
	   100MG, POR NO M??S DE 3 D??AS DE USO CONTINUO.','ORAL',109,10,9,95.00,9);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(10,'BUSCAPINA AMPOLLAS','10 AMPOLLAS DE 5ML CADA UNA','TRATAMIENTO DE LOS ESPASMOS AGUDOS DEL TRACTO GASTROINTESTINAL, BILIAR Y GENITO-URINARIO, INCLUYENDO 
	   C??LICO BILIAR Y RENAL. TAMBI??N SE UTILIZA COMO COADYUVANTE EN AQUELLOS PROCESOS DE DIAGN??STICO Y TERAP??UTICA EN LOS QUE EL 
	   ESPASMO PUEDE SUPONER UN PROBLEMA, COMO LA ENDOSCOPIA GASTRO-DUODENAL Y LA RADIOLOG??A.',' 1- 2 AMPOLLAS (20- 40 MG), DOS 
	   VECES AL D??A.','INYECCI??N INTRAVENOSA.',110,10,10,210.00,10);
	  
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(11,'C??RCUMA',' BOLSA DE 16 GRAMOS, MARCA GOURMET','ENTRE SUS PRINCIPALES BENEFICIOS RESALTA SU PROPIEDAD ANTIINFLAMATORIA, LA CUAL INTERVIENE EN EL ORGANISMO 
	   AYUDANDO A DISIPAR LA INFLAMACI??N DE LAS ARTICULACIONES PRODUCTO DE CONDICIONES COMO LA ARTRITIS.ADEM??S, LA C??RCUMA TIENE EFECTO ANALG??SICO, QUE PERMITE ALIVIAR 
	   EL DOLOR DE LA ARTRITIS Y HACER QUE LA PERSONA PUEDA RECUPERAR LA MOVILIDAD DE SUS ARTICULACIONES POR LA AUSENCIA DEL MALESTAR','UNA TAZA AL D??A SER?? SUFICIENTE',
	   'ECHAR DOS CUCHARADAS DE C??RCUMA Y DOS DE JENGIBRE, AMBOS MOLIDOS, EN DOS TAZAS DE AGUA HIRVIENDO. UNA VEZ QUE LA PREPARACI??N HAYA REPOSADO DURANTE 20 MINUTOS, 
	   SE CUELA Y SE AGREGA MIEL PARA ENDULZAR',111,20,1,10.00,1);

Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(12,'ROMERO','BOLSA DE 20 GRAMOS','TIENE LA PROPIEDAD DE DISIPAR LA INFLAMACI??N Y, POR ESTA RAZ??N, ES UNO DE LOS MEJORES REMEDIOS CASEROS PARA EL DOLOR MUSCULAR. 
	   UTILIZAR SUS RAMAS ES IDEAL PARA ALCANZAR LA MEJOR??A','APLICAR DOS O TRES VECES AL D??A','HERVIR 30 GRAMOS DE HOJAS DE ROMERO Y LUEGO HUMEDECER UN PA??O CON ESTE 
	   AGUA Y COLOCAR SOBRE LA ZONA AFECTADA.',112,20,2,15.00,2);
	
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(13,'JENGIBRE','BOLSA CON DOS RA??CES DE JENGIBRE','ES COM??N EN ALIMENTOS Y MEDICINAS EN TODO EL MUNDO. LA PLANTA DE JENGIBRE ES RICA EN SUSTANCIAS QU??MICAS 
	   NATURALES QUE PUEDEN PROMOVER TU SALUD Y BIENESTAR. EL AGUA DE JENGIBRE, TAMBI??N CONOCIDA COMO T?? DE JENGIBRE, ES UNA FORMA DE DISFRUTAR LOS BENEFICIOS DEL 
	   JENGIBRE.','CONSUMIR UN M??XIMO DE 3 A 4 GRAMOS DE EXTRACTO DE JENGIBRE POR D??A.','TENDR??S QUE COCINAR EL JENGIBRE EN AGUA Y HACER UN T??. PUEDES DEJARLE LA 
	   PIEL DADO QUE NO VAS A COMER EL JENGIBRE. ADEM??S, MUCHOS DE LOS NUTRIENTES EST??N JUSTO DEBAJO DE LA PIEL. PUEDES USAR M??S O MENOS AGUA O JENGIBRE DEPENDIENDO 
	   DE QU?? TAN CONCENTRADA QUIERAS QUE SEA LA BEBIDA. LA PROPORCI??N DE AGUA A JENGIBRE ABAJO ES EQUIVALENTE A 1 GRAMO DE EXTRACTO DE JENGIBRE.',113,20,3,15.00,3);

Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(14,'T?? DE LAVANDA','BOLSA DE 5 GRAMOS  FLORES DE LAVANDA','ES UNA DE LAS INFUSIONES QUE M??S BENEFICIOS APORTA A LA SALUD, DEBIDO A LAS PROPIEDADES PROCEDENTES 
	   DE SU COMPOSICI??N, YA QUE SE ELABORA POR CONDUCTO DE ESAS PEQUE??AS FLORES COLOR VIOLETA QUE SON POPULARES POR AYUDAR A DISMINUIR LA ANSIEDAD, CONTROLAR EL 
	   ESTR??S AS?? COMO PODER RELAJAR EL CUERPO Y LA MENTE','TOMAR UN VASO AL D??A',':COLOCAR EN UNA OLLA PEQUE??A LAS TAZAS DEL AGUA FR??A Y DEJAR HERVIR A FUEGO MEDIO-ALTO 
	   HASTA EL PUNTO DE EBULLICI??N, CUANDO EST?? A PUNTO DE HERVIR, INCORPORAMOS LA LAVANDA, APAGAMOS EL FUEGO Y DEJAMOS REPOSAR POR UNOS 15 MINUTOS. CON AYUDA DE UN 
	   COLADOR, SERVIMOS EL T?? EN UN VASO Y RETIRAMOS LAS FLORES DE LAVANDA ADEM??S DE ENDULZAR CON LA MIEL AL GUSTO, SI AS?? LO DESEAMOS.',114,20,4,06.00,4);

Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(15,'MENTA','BOLSA DE LA MARCA HIDRO AGRO, 10 GRAMOS','ESTA PLANTA, POR SUS PROPIEDADES, SE UTILIZA CON FRECUENCIA PARA EL TRATAMIENTO DELAS FIEBRES EN SU PERSONA. 
	   CONTIENE GRANDES CANTIDADES DE VITAMINAS Y MINERALES EN SUS HOJAS, Y ??STAS CONTIENEN PROPIEDADES QUE SON DE GRAN RELEVANCIA EN EL PROCESO.','ESTE T?? DEBE TOMARSE 
	   VARIAS VECES AL D??A Y DE PREFERENCIA SIEMPRE ANTES DE ACOSTARSE.','EN UNA TAZA DE T?? AGREGAR 1 CUCHARADA DE LA MEZCLA DE PLANTAS Y AGREGAR 150 ML DE AGUA HIRVIENDO. 
	   DEJAR REPOSAR DURANTE 10 MINUTOS Y COLAR. PARA FAVORECER LA SUDORACI??N Y DISMINUIR LA FIEBRE',115,20,5,06.00,5);
	
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(16,'SAL GORDA','BOLSA DE 15 GRAMOS MARCA ALIPENDE','TAMBI??N CONOCIDA COMO SAL GRUESA, ES UNA SAL DE CRISTALES GRUESOS Y GRANDES, QUE GENERALMENTE SE EMPLEA PARA 
	   CONTRAATACAR EL DOLOR DE MUELAS, LAS DIFERENCIAS M??S NOTABLES ENTRE LOS DISTINTOS TIPOS DE SAL, SE ENCUENTRAN EN SU SABOR, LA TEXTURA Y EL PROCESAMIENTO.','APLICAR
	   TRES VECES AL D??A','PONER UN GRANO DE SAL GORDA EN LA CARIE DE LA MUELA, HASTA QUE SE DERRITA.',116,20,6,20.00,6);
	   
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(17,'LIM??N','BOLSA DE LIMONES DE 20 UNIDADES','LIM??N PARA CURAR LOS MAREOS. ESTA SENSACI??N PUEDE APARECER EN CUALQUIER MOMENTO, POR TANTO CUANDO TE OCURRA ESTO Y 
	   APAREZCAN LOS PRIMEROS S??NTOMAS SER??A RECOMENDABLE TOMAR O LAMER LIM??N, YA QUE ESTOS ALIMENTOS CONTIENEN ALTOS NIVELAS DE TANINO QUE ALIVIAN LAS N??USEAS Y LOS 
	   S??NTOMAS DEL MAREO.','TOMAR CINCO GOTAS AL D??A ','CORTA EL LIM??N POR LA MITAD Y TOMA UNA GOTAS DE ??L O CHUPA ESTE.',117,20,7,15.00,7);
	
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(18,'MIEL','TARRO DE MIEL DE 60 GRAMOS','SEG??N ALGUNOS ESTUDIOS LA MIEL PUEDE ALIVIAR LA TOS Y PODER MEJORAR EN ESTE ESTADO Y NO SENTIRNOS MAL.','BEBE ESTA MEZCLA 
	   UNA O DOS VECES AL D??A','MEZCLA 2 CUCHARADAS SOPERAS CON AGUA CALIENTE Y UN T?? DE HIERBABUENA.',118,20,8,30.00,8);
	
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(19,'T?? DE HIERBABUENA','BOLSA DE 6 GRAMOS, MARCA PYFLOR','EL MENTOL DE LA HIERBABUENA TIENE UNA COMPROBADA REPUTACI??N COMO ANALG??SICO; POR LO QUE HACER UN T?? PARA 
	   CALMAR EL DOLOR MENSTRUAL ES UNA IDEA MUY ACERTADA. SI EST??S BUSCANDO QU?? TOMAR PARA LOS C??LICOS, LA HIERBABUENA SE ENCUENTRA ENTRE LAS HIERBAS PARA DOLORES 
	   MENSTRUALES M??S EFECTIVA.','UNA VASO AL D??A ','COLOCAR EN UNA OLLA PEQUE??A LAS TAZAS DE AGUA FR??A Y DEJAR HERVIR A FUEGO MEDIO-ALTO HASTA EL PUNTO DE EBULLICI??N, 
	   CUANDO EST?? A PUNTO DE HERVIR, INCORPORAMOS LA HIERBABUENA, APAGAMOS EL FUEGO Y DEJAMOS REPOSAR POR UNOS 15 MINUTOS. CON AYUDA DE UN COLADOR, SERVIMOS EL T?? EN UN 
	   VASO Y RETIRAMOS LAS HOJAS DE HIERBABUENA ADEM??S DE ENDULZAR CON LA MIEL AL GUSTO, SI AS?? LO DESEAMOS.',119,20,9,08.00,9);
	
Insert into products(id,name,presentation,description,posology,management,stock_code,category_id,inventory_id,price,discount_id)
values(20,'SOPA DE POLLO','BOLSA DE 57 GRAMOS, MARCA MAGGI, RINDE HASTA 5 PLATOS','TOMANDO ESTA SOPA CUANDO EST??S ENFERMO CONSEGUIR??S QUE LA IRRITACI??N QUE TIENES EN LA 
	   GARGANTA BAJE CONSIDERABLEMENTE. ADEM??S, UNO DE LOS S??NTOMAS M??S MOLESTOS DE ESTA ENFERMEDAD ES LA CONGESTI??N NASAL LA CUAL TAMBI??N BAJAR?? CONSIDERABLEMENTE HASTA 
	   QUE TE SIENTAS COMO UNA PERSONA NUEVA..','TOMAR UN PLATO AL D??A ','HERVIR AGUA EN UNA OLLA CUANDO ESTA EST?? EN SU PUNTO DE EBULLICI??N PUEDES AGREGAR EL SOBRE DE 
	   SOPA DE POLLO, PARA QUE ESTA TENGA M??S SABOR SI DESEAS PUEDES AGREGAR VERDURAS A TU RECETA.',120,20,10,05.00,10);
END;


ALTER table PRODUCTS ADD COLUMN product_pict  character varying(250);