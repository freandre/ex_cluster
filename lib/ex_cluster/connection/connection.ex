defmodule ExCluster.Connection do
	def connect(node) do
		IO.inspect(node, label: "Connecting node")
		Node.connect(node)
	end

	def disconnect(node) do
		IO.inspect(node, label: "Disconnecting node")
		Node.disconnect(node)
	end

	def list(args) do
		IO.inspect(args, label: "List nodes")
		Node.list(args)
	end
end
