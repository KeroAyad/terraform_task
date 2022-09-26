data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "/home/kero/terraform/modules/message_notification/python"
output_path = "/home/kero/terraform/modules/message_notification/python.zip"
}
