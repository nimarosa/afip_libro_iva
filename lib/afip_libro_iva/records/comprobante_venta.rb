module AfipLibroIva
  class ComprobanteVenta < Fixy::Record
    include Fixy::Formatter::Alphanumeric

    set_record_length 266

    # Fields Declaration:
    # -----------------------------------------------------------
    #       name          size      Range             Format
    # ------------------------------------------------------------

    field :fecha,     8,     '1-8' ,      :numeric
    field :tipo_comprobante ,     3,     '9-11',      :numeric
    field :punto_venta ,     5,     '12-16',      :numeric
    field :numero_comprobante ,     20,     '17-36',      :numeric
    field :numero_comprobante_hasta ,     20,     '37-56',      :numeric
    field :cod_documento_comprador ,     2,     '57-58',      :numeric
    field :numero_identificador_comprador ,     20,     '59-78',      :alphanumeric
    field :identificacion_comprador ,     30,     '79-108',      :alphanumeric
    field :importe_total ,     15,     '109-123',      :numeric
    field :importe_no_gravado ,     15,     '124-138',      :numeric
    field :percepcion_no_categorizados ,     15,     '139-153',      :numeric
    field :importe_exento ,     15,     '154-168',      :numeric
    field :importe_pagos_a_cuenta ,     15,     '169-183',      :numeric
    field :importe_iibb ,     15,     '184-198',      :numeric
    field :importe_municipales ,     15,     '199-213',      :numeric
    field :importe_internos ,     15,     '214-228',      :numeric
    field :codigo_moneda ,     3,     '229-231',      :alphanumeric
    field :tipo_cambio ,     10,     '232-241',      :numeric
    field :cantidad_alicuotas ,     1,     '242-242',      :numeric
    field :codigo_operacion ,     1,     '243-243',      :alphanumeric
    field :importe_otros_tributos ,     15,     '244-258',      :numeric
    field :vencimiento_pago ,     8,     '259-266',      :numeric


    def initialize(comprobante)
      @fecha = comprobante[:fecha].strftime('%Y%m%d')
      @tipo_comprobante = comprobante[:tipo_comprobante]
      @punto_venta = comprobante[:punto_venta]
      @numero_comprobante = comprobante[:numero_comprobante]
      @numero_comprobante_hasta = comprobante[:numero_comprobante]
      @cod_documento_comprador = comprobante[:tipo_documento]
      @numero_identificador_comprador = comprobante[:documento]
      @identificacion_comprador = comprobante[:razon_social].truncate(29)
      @importe_total = comprobante[:importe_total] || 0
      @importe_no_gravado = comprobante[:importe_no_gravado] || 0
      @percepcion_no_categorizados = 0
      @importe_exento = comprobante[:importe_exento] || 0
      @importe_pagos_a_cuenta = comprobante[:importe_a_cuenta_iva] || 0
      @importe_iibb = comprobante[:importe_iibb] || 0
      @importe_municipales = comprobante[:importe_municipales] || 0
      @importe_internos = comprobante[:importe_internos] || 0
      @codigo_moneda = comprobante[:moneda] || 'PES'
      @cantidad_alicuotas = comprobante[:cantidad_alicuotas]
      @codigo_operacion = comprobante[:codigo_operacion] || "O"
      @importe_otros_tributos = comprobante[:otros_tributos] || 0
      @vencimiento_pago = comprobante[:vencimiento] || Date.today.strftime('%Y%m%d')
    end

  end
end