data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "/home/kero/lambda/python"
output_path = "/home/kero/lambda/python/python.zip"
}
