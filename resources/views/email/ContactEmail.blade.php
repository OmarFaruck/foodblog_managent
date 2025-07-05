<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
    <div style="margin:50px auto;width:70%;padding:20px 0">
        <div style="border-bottom:1px solid #eee">
            <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">Foodieland</a>
        </div>
        <p style="font-size:1.1em">Hi there, Admin! 👋</p>
        <p>Great news! You've got a new message from a fellow foodie on Foodieland! 🍽️</p>
        <p>Someone has reached out through your contact form and we wanted to make sure you didn't miss it.</p>
        
        <div style="background: #00466a;margin: 20px auto;width: max-content;padding: 15px 25px;color: #fff;border-radius: 8px;text-align: center;">
            <h3 style="margin: 0;">📧 New Contact Message</h3>
        </div>
        
        <div style="background-color:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0;border-left:4px solid #00466a">
            <h3 style="color:#00466a;margin-top:0">📝 Contact Details:</h3>
            <p><strong>👤 Name:</strong> {{$customerName}}</p>
            <p><strong>📧 Email:</strong> {{$customerEmail}}</p>
            <p><strong>📋 Subject:</strong> {{$customerSubject}}</p>
            <p><strong>🏷️ Enquiry Type:</strong> {{$customerEnquiryType}}</p>
        </div>
        
        <div style="background-color:#fff;padding:20px;border-radius:8px;border:2px solid #f8f9fa;margin:20px 0">
            <h3 style="color:#00466a;margin-top:0">💬 Their Message:</h3>
            <div style="background-color:#f8f9fa;padding:15px;border-radius:6px;font-style:italic">
                <p style="white-space:pre-wrap;margin:0">"{{$customerMessage}}"</p>
            </div>
        </div>

        <p>Time to work your magic and respond with some delicious help! 🎯</p>
        <p style="font-size:0.9em;">Happy Cooking & Connecting,<br />The Foodieland Team 🍳</p>
        <hr style="border:none;border-top:1px solid #eee" />
        <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
            <p>Foodieland</p>
            <p>Your Ultimate Food Destination</p>
        </div>
    </div>
</div>
