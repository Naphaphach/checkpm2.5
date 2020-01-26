var http = require("http");
var iftttWebhookEventName = ""; //Use your event name.
var iftttWebhookApiKey = ""; //Use your IFTTT Webhook API Key.

try {
    // Get AQI Bangkok from AireVisual
    var airVisualApiKey = ""; //Use your AirVisual Api key.
    
    var airVisualRequestBangyai = {
            "url" : "http://api.airvisual.com/v2/city",
            "params" : {
                country: "Thailand",
                state: "Nonthaburi",
                city: "Bang Yai",
                key: airVisualApiKey
            },
            "method" : "GET" // optional if GET
     }
     
     var airVisualRequestBangkok = {
            "url" : "http://api.airvisual.com/v2/city",
            "params" : {
                country: "Thailand",
                state: "Bangkok",
                city: "Taling Chan",
                key: airVisualApiKey
            },
            "method" : "GET" // optional if GET
     }
     
     var airVisualRequestCompany = {
            "url" : "http://api.airvisual.com/v2/city",
            "params" : {
                country: "Thailand",
                state: "bangkok",
                city: "Bang Rak",
                key: airVisualApiKey
            },
            "method" : "GET" // optional if GET
     }
     
    var response_bangyai = http.request(airVisualRequestBangyai);
    var response_bangkok = http.request(airVisualRequestBangkok);
    var response_company = http.request(airVisualRequestCompany);
    
    var airVisualResponse_bangyai = JSON.parse(response_bangyai.body)
    var airVisualResponse_bangkok = JSON.parse(response_bangkok.body)
    var airVisualResponse_company = JSON.parse(response_company.body)
    
    console.debug(airVisualResponse_bangyai);
    console.debug(airVisualResponse_bangkok);
    console.debug(airVisualResponse_company);
    
    var aqi_bangyai = airVisualResponse_bangyai.data.current.pollution.aqius;
    var aqi_bangkok = airVisualResponse_bangkok.data.current.pollution.aqius;
    var aqi_company = airVisualResponse_company.data.current.pollution.aqius;
    
    var title = "";
    var message = "";
    
    if (aqi_bangyai > 150) {
        title_bangyai = " 🏠👧🏻 HOME MOM AQI Level: Danger [" + aqi_bangyai + "] ";
        message_bangyai = " 🛑😷 High Dust! Mask recommended, don't go outside! (ค่าฝุ่นสูงมาก ควรใส่แมส!)";
    } else if (aqi_bangyai > 100) {
        title_bangyai = " 🏠👧🏻 HOME MOM AQI Level: Unhealty [" + aqi_bangyai + "] ";
        message_bangyai = " ⚠️😷 Dust! Mask recommended (ยังไม่ปลอดภัยนะ ใส่แมสด้วย!)";
    } else if (aqi_bangyai >50){
        title_bangyai = " 🏠👧🏻 HOME MOM AQI Level: Not Safe [" + aqi_bangyai + "] ";
        message_bangyai = " 💙 Be careful! (แมสปกติก็ได้ ใกล้ปลอดภัยแล้ว)";
    } else {
        title_bangyai = " 🏠👧🏻 HOME MOM AQI Level: healty! [" + aqi_bangyai + "] ";
        message_bangyai = " 🟢 Finally Safe!!! (เซฟแล้วจ้าาาา!)" ;
    }
    
    if (aqi_company > 150) {
        title_company = " 🖱️ MY COMPANY AQI Level: Danger [" + aqi_company + "] ";
        message_company = " 🛑😷 High Dust! Mask recommended, don't go outside! (ค่าฝุ่นสูงมาก ควรใส่แมส!)";
    } else if (aqi_company > 100) {
        title_company = " 🖱️ MY COMPANY AQI Level: Unhealty [" + aqi_company + "] ";
        message_company = " ⚠️😷 Dust! Mask recommended (ยังไม่ปลอดภัยนะ ใส่แมสด้วย!)";
    } else if (aqi_company >50){
        title_company = " 🖱️ MY COMPANY AQI Level: Not Safe [" + aqi_company + "] ";
        message_company = " 💙 Be careful! (แมสปกติก็ได้ ใกล้ปลอดภัยแล้ว)";
    } else {
        title_company = " 🖱️ MY COMPANY AQI Level: healty! [" + aqi_company + "] ";
        message_company = " 🟢Finally Safe!!! (เซฟแล้วจ้าาาา!)" ;
    }

   	if (aqi_bangkok > 150) {
        title_bangkok = "🏠👦🏻 HOME DAD AQI Level: Danger [" + aqi_bangkok + "] ";
        message_bangkok = " 🛑😷 High Dust! Mask recommended, don't go outside! (ค่าฝุ่นสูงมาก ควรใส่แมส!)";
    } else if (aqi_bangkok > 100) {
        title_bangkok = " 🏠👦🏻 HOME DAD AQI Level: Unhealty [" + aqi_bangkok + "] ";
        message_bangkok = " ⚠️😷 Dust! Mask recommended (ยังไม่ปลอดภัยนะ ใส่แมสด้วย!)";
    } else if (aqi_bangkok >50){
        title_bangkok = " 🏠👦🏻 HOME DAD AQI Level: Not Safe [" + aqi_bangkok + "] ";
        message_bangkok = " 💙 Be careful! (แมสปกติก็ได้ ใกล้ปลอดภัยแล้ว)";
    } else {
        title_bangkok = " 🏠👦🏻 HOME DAD AQI Level: healty! [" + aqi_bangkok + "] ";
        message_bangkok = " 🟢 Finally Safe!!! (เซฟแล้วจ้าาาา!)" ;
    }
    
    if (aqi_bangyai > 50 || aqi_bangkok > 50 || aqi_company > 50) {
        var requestObjectBangyai = {
            "url" : "https://maker.ifttt.com/trigger/" + iftttWebhookEventName + "/with/key/" + iftttWebhookApiKey,
            "params" : {
                "value1": title_bangyai,
                "value2": aqi_bangyai,
                "value3": message_bangyai
            },
            "method" : "GET" // optional if GET
        }
        var response_bangyai = http.request(requestObjectBangyai);
        var responseBodyStrBangyai = response_bangyai.body;

        var requestObjectBangkok = {
            "url" : "https://maker.ifttt.com/trigger/" + iftttWebhookEventName + "/with/key/" + iftttWebhookApiKey,
            "params" : {
                "value1": title_bangkok,
                "value2": aqi_bangkok,
                "value3": message_bangkok,
            },
            "method" : "GET" // optional if GET
        }
        var response_bangkok= http.request(requestObjectBangkok);
        var responseBodyStrBangkok = response_bangkok.body;
        
        var requestObjectCompany = {
            "url" : "https://maker.ifttt.com/trigger/" + iftttWebhookEventName + "/with/key/" + iftttWebhookApiKey,
            "params" : {
                "value1": title_company,
                "value2": aqi_company,
                "value3": message_company,
            },
            "method" : "GET" // optional if GET
        }
        
        var response_company = http.request(requestObjectCompany);
        var responseBodyStrCompany = response_company.body;
        
        if (response_bangyai.status == "200" && response_company.status == "200" && response_bangkok.status == "200") {
            if (response_bangyai.headers["Content-Type"].indexOf("application/json") > -1 && response_company.headers["Content-Type"].indexOf("application/json") > -1 && response_bangkok.headers["Content-Type"].indexOf("application/json") > -1) {
                return JSON.parse(responseBodyStrBangyai + responseBodyStrCompany + responseBodyStrBangkok);
            }
            return responseBodyStrBangyai;
        } else {
            return "Remote API returned an error " + response_bangyai.status + response_company.status + response_bangkok.status;
        }
    }
	
    return ""
    
} catch(exception) { 
    return exception;
}
