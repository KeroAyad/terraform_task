import json
import boto3

def lambda_handler(event, context):
    
    ses = boto3.client('ses')

    body = """
		Hello,
		Your state file has an update.	
	    Regards,
	    Kero
    """

    ses.send_email(
	    Source = 'kyrillos.king@gmail.com',
	    Destination = {
		    'ToAddresses': [
			    'kerolos.ayad@outlook.com'
		    ]
	    },
	    Message = {
		    'Subject': {
			    'Data': 'SES Demo',
			    'Charset': 'UTF-8'
		    },
		    'Body': {
			    'Text':{
				    'Data': body,
				    'Charset': 'UTF-8'
			    }
		    }
	    }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully sent email from Lambda using Amazon SES')
    }