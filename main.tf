/**
 * # ![AWS](aws-logo.png) DynamoDB Table
 *
 * Purpose: Blueprints for templated DynamoDB tables
 */
resource "aws_dynamodb_table" "table" {
  name      = var.name
  hash_key  = var.hash_key
  range_key = var.range_key
  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.key
      type = attribute.value
    }
  }
  point_in_time_recovery {
    enabled = true
  }
  billing_mode = "PAY_PER_REQUEST"
}
