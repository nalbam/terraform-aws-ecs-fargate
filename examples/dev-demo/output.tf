# output

output "cluster_id" {
  value = data.terraform_remote_state.ecs.outputs.cluster_id
}

output "cluster_name" {
  value = data.terraform_remote_state.ecs.outputs.cluster_name
}
