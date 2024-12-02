class CheckoutController < ApplicationController

    # POST, so product_id will be in the POST payload!
    def create
        # Create a Stripe session

        # redirect the user to the checkout page

        # fetch the product in question!
        product = Product.find(params[:id])

        if product.nil?
            redirect_to root_path
            return
        end

        #establish connection with Stipe
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ["card"],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
            mode: "payment",
            line_items: [
                price_data: {
                    currency: "cad",
                    product_data: {
                        name: product.name,
                        description: product.description,
                    }, 
                    unit_amount: product.price.to_i,
                },
                quantity: 1
            ],
            mode: 'payment',
            success_url: root_url,
            cancel_url: root_url
        })

        redirect_to @session.url, allow_other_host: true
    end

    def success
        # we go here if the payment succeeded!
    end

    def cancel
        # something went wrong!
    end

end
