<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactEmail extends Mailable
{
    use Queueable, SerializesModels;


    public $customerName, $customerEmail, $customerSubject, $customerEnquiryType, $customerMessage;

    public function __construct($cname, $cemail, $csubject, $cenquiryType, $cmessage)
    {
        $this->customerName = $cname;
        $this->customerEmail = $cemail;
        $this->customerSubject = $csubject;
        $this->customerEnquiryType = $cenquiryType;
        $this->customerMessage = $cmessage;
    }

    /**
     * Get the message envelope.
     */
    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Contact Form: '.$this->customerSubject.' - From "'.$this->customerName.'"',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'email.ContactEmail',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
