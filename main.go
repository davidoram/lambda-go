package main

import (
	"log"
	"strings"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// Handler is your Lambda function handler
// It uses Amazon API Gateway request/responses provided by the aws-lambda-go/events package,
// However you could use other event sources (S3, Kinesis etc), or JSON-decoded primitive types such as 'string'.
func Handler(request events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	log.Printf("Processing Lambda request %t\n", request.RequestContext)
	log.Printf("Path %s\n", request.Path)

	if strings.HasSuffix(request.Path, "byebye") {
		// stdout and stderr are sent to AWS CloudWatch Logs
		return events.APIGatewayProxyResponse{
			Body:       "Bye Bye",
			StatusCode: 200,
		}, nil
	}

	// stdout and stderr are sent to AWS CloudWatch Logs
	return events.APIGatewayProxyResponse{
		Body:       "Hello world",
		StatusCode: 200,
	}, nil
}

func main() {
	log.Printf("Start lambda")
	lambda.Start(Handler)
}
