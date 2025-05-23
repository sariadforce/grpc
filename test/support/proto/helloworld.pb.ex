defmodule Helloworld.HelloRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :name, 1, type: :string
  field :duration, 2, proto3_optional: true, type: :int32
end

defmodule Helloworld.HelloReply do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :message, 1, type: :string
end

defmodule Helloworld.HeaderRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3
end

defmodule Helloworld.HeaderReply do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.14.1", syntax: :proto3

  field :authorization, 1, type: :string
end

defmodule Helloworld.Greeter.Service do
  @moduledoc false

  use GRPC.Service, name: "helloworld.Greeter", protoc_gen_elixir_version: "0.14.1"

  rpc(:SayHello, Helloworld.HelloRequest, Helloworld.HelloReply, %{})

  rpc(:CheckHeaders, Helloworld.HeaderRequest, Helloworld.HeaderReply, %{})
end

defmodule Helloworld.Greeter.Stub do
  @moduledoc false

  use GRPC.Stub, service: Helloworld.Greeter.Service
end
