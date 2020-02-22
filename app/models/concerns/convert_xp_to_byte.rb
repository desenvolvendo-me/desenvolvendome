module ConvertXpToByte
  extend ActiveSupport::Concern

  def xp
    number = 0
    bytes = self[:xp].to_i
    kilobytes = (bytes.to_f / 1024)
    megabytes = (kilobytes.to_f / 1024)
    gigabytes = (megabytes.to_f / 1024)

    number = bytes.to_f.round(2).to_s + "b" if bytes > 1
    number = kilobytes.to_f.round(2).to_s + "kb" if kilobytes > 1
    number = megabytes.to_f.round(2).to_s + "mb" if megabytes > 1
    number = gigabytes.to_f.round(2).to_s + "gb" if gigabytes > 1
    number
  end

end
