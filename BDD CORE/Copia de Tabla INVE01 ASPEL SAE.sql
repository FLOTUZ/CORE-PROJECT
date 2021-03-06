create or replace table core.aspel
(
    CVE_ART                varchar(16)                              not null comment 'Clave del articulo',
    DESCR                  varchar(40)                              null comment 'Descripción',
    LIN_PROD               varchar(5)                               null comment 'Clave de línea',
    CON_SERIE              varchar(1)                               null comment 'Con serie [S/N] .: S=Si, N=No',
    UNI_MED                varchar(10)                              null comment 'Unidad de entrada',
    UNI_EMP                double                                   null comment 'Unidad de empaque {mayores a 0.0}',
    CTRL_ALM               varchar(10)                              null comment 'Control de almacén',
    TIEM_SURT              int                                      null comment 'Tiempo de surtido {0.0..}',
    STOCK_MIN              double                                   null comment 'Stock mínimo {0.0 .. }',
    STOCK_MAX              double                                   null comment 'Stock máximo {0.0 ..}',
    TIP_COSTEO             varchar(1)                               null comment 'Tipo de costeo [P/I/U/S/E] .: P=Promedio, I=Identificado, U=UEPS, S=Estandar, E=PEPS',
    NUM_MON                int                                      null comment 'Clave de moneda',
    FCH_ULTCOM             timestamp  default current_timestamp()   not null on update current_timestamp() comment 'Fecha de última compra',
    COMP_X_REC             double                                   null comment 'Pendientes por recibir',
    FCH_ULTVTA             timestamp  default '0000-00-00 00:00:00' not null comment 'Fecha de última venta',
    PEND_SURT              double                                   null comment 'Pendientes por surtir {0.0 ..]',
    EXIST                  double                                   null comment 'Existencias {0.0 ..}',
    COSTO_PROM             double                                   null comment 'Costo promedio {0.0 ..}',
    ULT_COSTO              double                                   null comment 'Último costo {0.0 ..}',
    CVE_OBS                int                                      null comment 'Clave de observaciones',
    TIPO_ELE               varchar(1)                               null comment 'Tipo de elemento [P/K/G/S] .: P=Producto, K=Kits, G=Grupo, S=Servicio',
    UNI_ALT                varchar(10)                              null comment 'Unidad de salida',
    FAC_CONV               double                                   null comment 'Factor entre unidades {mayores a  0.0}',
    APART                  double                                   null comment 'Apartados {0.0 ..}',
    CON_LOTE               varchar(1)                               null comment 'Con lote [S / N]',
    CON_PEDIMENTO          varchar(1)                               null comment 'Con pedimento [S / N]',
    PESO                   double                                   null comment 'Peso {0.0 ..}',
    VOLUMEN                double                                   null comment 'Volumen {0.0..}',
    CVE_ESQIMPU            int                                      null comment 'Clave de esquema',
    CVE_BITA               int                                      null comment 'Clave de bitácora',
    VTAS_ANL_C             double                                   null comment 'Cantidad de ventas anuales',
    VTAS_ANL_M             double                                   null comment 'Monto de ventas anuales',
    COMP_ANL_C             double                                   null comment 'Cantidad de compras anuales',
    COMP_ANL_M             double                                   null comment 'Monto de compras anuales',
    PREFIJO                varchar(8)                               null comment 'Modelo',
    TALLA                  varchar(8)                               null comment 'Talla',
    COLOR                  varchar(8)                               null comment 'Color',
    CUENT_CONT             varchar(28)                              null comment 'Cuenta contable',
    CVE_IMAGEN             varchar(16)                              null comment 'Nombre de la imagen',
    BLK_CST_EXT            varchar(1)                               null comment 'Bloqueado por costos-existencias. [S/N] .: S=Si, N=No',
    STATUS                 varchar(1)                               null comment 'Estatus [A/B] .: A=Activo, B=Baja',
    MAN_IEPS               varchar(1) default 'N'                   null comment 'Manejo del IEPS. [S/N]: S=Si, N=No',
    APL_MAN_IMP            int        default 1                     null comment 'Número de impuesto para aplicarle el manejo del IEPS. [1-4]',
    CUOTA_IEPS             double     default 0                     null comment 'Cuota que maneja el IEPS.',
    APL_MAN_IEPS           varchar(1) default 'C'                   null comment 'Forma en que se aplicará el manejo del IEPS [C/M/A]. C=Cuota, M=Mas alto, A=Ambos.',
    UUID                   varchar(50)                              null comment 'ID para sincronización con SAE Movil',
    VERSION_SINC           timestamp  default '0000-00-00 00:00:00' not null comment 'Fecha y hora para sincronización con SAE Movil',
    VERSION_SINC_FECHA_IMG timestamp  default '0000-00-00 00:00:00' not null comment 'Fecha y hora para sincronización de la imagen del producto para SAE Movil',
    CVE_PRODSERV           varchar(9)                               null comment 'Clave del producto o servicio SAT',
    CVE_UNIDAD             varchar(4)                               null comment 'Clave de la unidad SAT',
    EDO_PUBL_ML            varchar(1)                               null comment 'Estado publicación',
    CVE_PUBL_ML            varchar(20)                              null comment 'Clave publicación',
    CONDICION_ML           varchar(5)                               null comment 'Condición Nuevo/Usado',
    TIPO_PUBL_ML           varchar(12)                              null comment 'Tipo publicación Gratis/Clasica/Premium',
    MODO_ENVIO_ML          varchar(15)                              null comment 'Modo envío Mercado Envío/ No especificado',
    LARGO_ML               double                                   null comment 'Largo',
    ALTO_ML                double                                   null comment 'Alto',
    ANCHO_ML               double                                   null comment 'Ancho',
    ENVIO_ML               varchar(2)                               null comment 'Envío gratis Si/No',
    CATEG_ML               varchar(30)                              null comment 'Categoría',
    CAMPOS_CATEG_ML        varchar(3000)                            null comment 'Campos categoría',
    DISPONIBLE_PUBL        varchar(1)                               null comment 'Disponible para publicar',
    CVE_CATE_ML            varchar(20)                              null comment 'Clave categoría',
    LAST_UPDATE_ML         varchar(30)                              null comment 'Fecha de última actualización en Mercado Libre',
    F_CREA_ML              timestamp  default '0000-00-00 00:00:00' not null comment 'Fecha creación de la publicación',
    IMAGEN_ML              blob                                     null comment 'Imagen producto'
);