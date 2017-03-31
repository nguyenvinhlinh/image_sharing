defmodule ImageSharing.Utilities do
  def convert_data_to_base64(data) do
    :base64url.encode(data)
  end

  def convert_base64_to_data(base64) do
    :base64url.decode(base64)
  end

  def generate_string() do
    "#{:os.system_time}"
  end
end
