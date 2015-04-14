from boto.dynamodb2.layer1 import DynamoDBConnection
import os
import unittest


class TestDynamoDB(unittest.TestCase):

    def test_dynamodb(self):
        host = os.getenv('DYNAMODB_PORT_8000_TCP_ADDR')
        port = int(os.getenv('DYNAMODB_PORT_8000_TCP_PORT'))
        
        conn = DynamoDBConnection(
            host=host,
            port=port,
            aws_access_key_id='anything',
            aws_secret_access_key='anything',
            is_secure=False)

        tables = conn.list_tables()


if __name__ == '__main__':
    unittest.main()
