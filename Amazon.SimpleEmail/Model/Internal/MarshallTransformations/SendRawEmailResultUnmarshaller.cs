/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 * 
 *  http://aws.amazon.com/apache2.0
 * 
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */
using System.Collections.Generic;

using Amazon.SimpleEmail.Model;
using Amazon.Runtime.Internal.Transform;

namespace Amazon.SimpleEmail.Model.Internal.MarshallTransformations
{
     /// <summary>
     ///   SendRawEmailResult Unmarshaller
     /// </summary>
    internal class SendRawEmailResultUnmarshaller : IUnmarshaller<SendRawEmailResult, XmlUnmarshallerContext> 
    {
        public SendRawEmailResult Unmarshall(XmlUnmarshallerContext context) 
        {
            SendRawEmailResult sendRawEmailResult = new SendRawEmailResult();
            int originalDepth = context.CurrentDepth;
            int targetDepth = originalDepth + 1;
            if (context.IsStartOfDocument) 
               targetDepth += 2;
            
            while (context.Read())
            {
                if (context.IsStartElement || context.IsAttribute)
                { 
                    if (context.TestExpression("MessageId", targetDepth))
                    {
                        sendRawEmailResult.MessageId = StringUnmarshaller.GetInstance().Unmarshall(context);
                            
                        continue;
                    }
                }
                else if (context.IsEndElement && context.CurrentDepth < originalDepth)
                {
                    return sendRawEmailResult;
                }
            }
                        


            return sendRawEmailResult;
        }

        private static SendRawEmailResultUnmarshaller instance;

        public static SendRawEmailResultUnmarshaller GetInstance() 
        {
            if (instance == null) 
               instance = new SendRawEmailResultUnmarshaller();

            return instance;
        }
    }
}
    
