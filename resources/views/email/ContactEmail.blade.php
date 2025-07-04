<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
    <div style="margin:50px auto;width:70%;padding:20px 0">
        <div style="border-bottom:1px solid #eee">
            <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">Food Blog</a>
        </div>
        <p style="font-size:1.1em">Hi Admin,</p>
        <p>You have received a new contact form submission from your Food Blog website.</p>
        
        <div style="background-color:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0">
            <h3 style="color:#00466a;margin-top:0">Contact Details:</h3>
            <p><strong>Name:</strong> {{$customerName}}</p>
            <p><strong>Email:</strong> {{$customerEmail}}</p>
            <p><strong>Subject:</strong> {{$customerSubject}}</p>
            <p><strong>Enquiry Type:</strong> {{$customerEnquiryType}}</p>
        </div>
        
        <div style="background-color:#fff;padding:20px;border-left:4px solid #00466a;margin:20px 0">
            <h3 style="color:#00466a;margin-top:0">Message:</h3>
            <p style="white-space:pre-wrap">{{$customerMessage}}</p>
        </div>

        <p style="font-size:0.9em;">Best regards,<br />Food Blog System</p>
        <hr style="border:none;border-top:1px solid #eee" />
        <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
            <p>Food Blog Contact System</p>
            <p>Automated Email</p>
        </div>
    </div>
</div>
