defmodule OptionChainWeb.OptionChainLive do

  use OptionChainWeb, :live_component
  @internal_topic "ticker:info"
  @impl true
  def mount(_params, session, socket) do

    list_oc_ticker =  Ticker.Repo.create_list_oc_ticker()

    # selected_ticker_oc = socket.assigns.selected_ticker_oc
    # Phoenix.PubSub.subscribe(BrokerWeb.PubSub, "oc:#{selected_ticker_oc}")
    # if (selected_ticker_oc == "300000"  or selected_ticker_oc == "300001" or selected_ticker_oc == "300002") do
    #   Phoenix.PubSub.broadcast!(
    #     BrokerWeb.PubSub,
    #     @internal_topic,
    #     {:subscribe_ioc, selected_ticker_oc}
    #   )
    # else
    #   Phoenix.PubSub.broadcast!(
    #     BrokerWeb.PubSub,
    #     @internal_topic,
    #     {:subscribe_oc, selected_ticker_oc}
    #   )
    # end


     Enum.map(list_oc_ticker, fn ticker ->
        IO.inspect(ticker,label: "ticker....")
      if ticker == "300000" or ticker == "300001" or ticker == "300002" do
        Phoenix.PubSub.broadcast!(
          BrokerWeb.PubSub,
          @internal_topic,
          {:unsubscribe_ioc, ticker}
        )
      else
        Phoenix.PubSub.broadcast!(
          BrokerWeb.PubSub,
          @internal_topic,
          {:unsubscribe_oc, ticker}
          )
      end
    end)
    selected_ticker_oc = "300000"
    Phoenix.PubSub.broadcast!(
        BrokerWeb.PubSub,
        @internal_topic,
        {:subscribe_ioc, selected_ticker_oc}
      )

    {:ok, assign(socket,
    # oc_data: [],
    oc_data: [
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"},
        %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}, %{buy_price_ce: "8985", buy_price_pe: "4275", buy_volume_ce: "900", buy_volume_pe: "600", expiry_date: "1382797800", ltp: "201760", ltp_ce: "0", ltp_pe: "5000", oi_ce: "0", open_interest_pe: "0", sell_price_ce: "15350", sell_price_pe: "0", sell_volume_ce: "900", sell_volume_pe: "0", strike_price: "198000", token_no: "22", total_volume_traded_ce: "0", total_volume_traded_pe: "0"}

      ],
      ticker_index_list: [{"NIFTY","300000"}, {"FINNIFTY","300001"}, {"BANKNIFTY","300002"}],
      selected_ticker_oc: selected_ticker_oc,
      # ticker_eq_list: Ticker.Repo.create_option_chain_eq_ticker_list(),
      # ticker_eq_list: [{300000, "NIFTY"}, {300001, "FINNIFTY"}, {300002, "BANKNIFTY"}],
      # selected_ticker: "300000"

      )}

  end

  @impl true
  def handle_info(_msg = {:subscribe_oc, data}, socket) do
    # IO.inspect(data, label: "subscribe_oc")
    # #IO.inspect("request_client_margin........")
    Phoenix.PubSub.broadcast!(
      BrokerWeb.PubSub,
      @internal_topic,
      {:subscribe_oc, data.selected_ticker}
    )

    {:noreply, socket}
  end

  @impl true
  def handle_info(_msg = {:subscribe_ioc, data}, socket) do
    # IO.inspect(data, label: "subscribe_ioc")
    # #IO.inspect("request_client_margin........")
    Phoenix.PubSub.broadcast!(
      BrokerWeb.PubSub,
      @internal_topic,
      {:subscribe_ioc, data.selected_ticker}
    )

    {:noreply, socket}
  end

  @impl true
  def handle_info(_msg = {:unsubscribe_oc, data}, socket) do
    # IO.inspect(data, label: "unsubscribe_oc")
    # #IO.inspect("request_client_margin........")
    Phoenix.PubSub.broadcast!(
      BrokerWeb.PubSub,
      @internal_topic,
      {:unsubscribe_oc, data.selected_ticker}
    )
    # Phoenix.PubSub.broadcast!(
    #   BrokerWeb.PubSub,
    # "ticker:info",
    # {:unsubscribe_oc, "10447"})
    {:noreply, socket}
  end

  @impl true
  def handle_info(_msg = {:unsubscribe_ioc, data}, socket) do
    # IO.inspect(data, label: "unsubscribe_ioc")
    # #IO.inspect("request_client_margin........")
    Phoenix.PubSub.broadcast!(
      BrokerWeb.PubSub,
      @internal_topic,
      {:unsubscribe_ioc, data.selected_ticker}
    )

    {:noreply, socket}
  end

  @impl true
  def handle_info(_msg = {:oc, [token | oc_data]}, socket) do
    # require Logger
    # Logger.info("oc in LiveSocket: #{token} #{inspect(oc_data)}")
    updated_data =
          Enum.map(oc_data, fn item ->
              %{
                token_no: token,
                symbol: Enum.at(item, 1),
                ltp: Enum.at(item, 2),
                expiry_date: Enum.at(item, 3),
                oi_ce: Enum.at(item, 4),
                total_volume_traded_ce: Enum.at(item, 5),
                ltp_ce: Enum.at(item, 6),
                buy_volume_ce: Enum.at(item, 7),
                buy_price_ce: Enum.at(item, 8),
                sell_price_ce: Enum.at(item,9),
                sell_volume_ce: Enum.at(item, 10),
                strike_price: Enum.at(item,11),
                buy_volume_pe: Enum.at(item, 12),
                buy_price_pe: Enum.at(item, 13),
                sell_price_pe: Enum.at(item, 14),
                sell_volume_pe: Enum.at(item, 15),
                ltp_pe: Enum.at(item, 16),
                total_volume_traded_pe: Enum.at(item, 17),
                open_interest_pe: Enum.at(item, 18)
              }
          end)
    Logger.info("updated_data in LiveSocket: #{token} #{inspect(updated_data)}")

    socket =
      assign(socket,
        oc_data: updated_data
      )


    {:noreply, socket}
  end


  def render(assigns) do
    ~L"""
    <div class= "option-chain-container">
      <div class= "option-chain-header-container">
        <div class="option-chain-header-title-cont">
          <span class="option-chain-header">
            Option Chain
          </span>
        </div>
        <div class = "select-option-cont">
          <%= if length(@ticker_index_list) > 0 do %>
            <div>
              <form phx-change="select-ticker-ioc">
                <span class="select-option-title">View Options Contracts for: </span>
                  <% option = @ticker_index_list %>
                  <select class="select-option-title" name="selected_ticker_oc">
                    <%= options_for_select(option, @selected_ticker_oc) %>
                  </select>
              </form>
            </div>
          <% end %>
          <%= if length(@ticker_eq_oc_list) > 0 do %>
            <div>
              <form phx-change="select-ticker-oc">
                <span class="select-option-title">Select Symbol </span>
                  <% option = @ticker_eq_oc_list %>
                  <select class= "select-option-title" name="selected_ticker_oc">
                    <%= options_for_select(option, @selected_ticker_oc) %>
                  </select>
              </form>
            </div>
          <% end %>
          <%= if length(@oc_data) > 0 do %>
              <%= if @selected_ticker_oc == hd(@oc_data).token_no do%>
            <%#= if "11536" == "11536" do%>
              <% ltp = :erlang.float_to_binary((String.to_integer(hd(@oc_data).ltp) / 100), [decimals: 2]) %>
              <div>
                <span class="select-option-title">
                  LTP: <%= ltp%>
                </span>
              </div>
            <%end%>
          <%end%>
        </div>
      </div>
      <%#= if "11536" == "11536" do%>
      <%= if length(@oc_data) > 0 do %>
        <%= if @selected_ticker_oc == hd(@oc_data).token_no do%>
      <div class="rule-table-cont">
        <table>
          <thead class="fixed-header">
            <tr>
              <th class="table-border-bottom common-th call-title" colspan="4"></th>
              <th class="table-border-bottom common-th call-title" colspan="4">CALLS</th>
              <th class="table-border-bottom common-th put-title" colspan="4">PUTS</th>
              <th class="table-border-bottom common-th call-title" colspan="4"></th>
            </tr>
            <tr>
              <th class="table-border-color common-th">
               OI
              </th>
              <th class="table-border-color common-th">
                total volume traded
              </th>
              <th class="table-border-color common-th">
                LTP
              </th>
              <th class="table-border-color common-th">
                Buy Volume
              </th>
              <th class="table-border-color common-th">
                Buy Price
              </th>
              <th class="table-border-color common-th">
                Sell Price
              </th>
              <th class="table-border-color common-th">
                Sell Volume
              </th>
              <th class="table-border-color common-th">
                Strike Price
              </th>
              <th class="table-border-color common-th">
                expiry Date
              </th>
              <th class="table-border-color common-th">
                Buy Volume
              </th>
              <th class="table-border-color common-th">
                Buy Price
              </th>
              <th class="table-border-color common-th">
                Sell Price
              </th>
              <th class="table-border-color common-th">
                Sell Volume
              </th>
              <th class="table-border-color common-th">
                LTP
              </th>
              <th class="table-border-color common-th">
                total volume traded
              </th>
              <th class="table-border-color common-th">
                OI
              </th>
            </tr>
          </thead>
          <%=  Enum.map(@oc_data, fn item -> %>
          <% {{y, mth, d}, {_h, _m, _s}} = :calendar.gregorian_seconds_to_datetime(62482752000 + String.to_integer(item.expiry_date))
                  expiry_date =  "#{y}#{pad_zero(mth)}#{pad_zero(d)}"
                  strike_price = :erlang.float_to_binary((String.to_integer(item.strike_price) / 100), [decimals: 1])
                  buy_price_ce = :erlang.float_to_binary((String.to_integer(item.buy_price_ce) / 100), [decimals: 2])
                  buy_price_pe = :erlang.float_to_binary((String.to_integer(item.buy_price_ce) / 100), [decimals: 2])
                  sell_price_ce = :erlang.float_to_binary((String.to_integer(item.sell_price_ce) / 100), [decimals: 2])
                  sell_price_pe = :erlang.float_to_binary((String.to_integer(item.sell_price_pe) / 100), [decimals: 2])
                  ltp = :erlang.float_to_binary((String.to_integer(item.ltp) / 100), [decimals: 2])

            %>
            <%=if item.token_no == @selected_ticker_oc do%>
            <%#= if "11536" == "11536" do%>
            <tbody>
              <tr>
                <td class="td-border-color common-td">
                  <span><%= item.oi_ce %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.total_volume_traded_ce%></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.ltp_ce%></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.buy_volume_ce%></span>
                </td>
                <td class="td-border-color common-td">
                  <div class = "btn-sub-cont">
                    <button type="submit"
                        style= "display:inline-block"
                        class="hide-button-oc tooltip other"
                          phx-click="buy_sell"
                          phx-value-select_ticker="<%= item.token_no %>"
                          phx-value-type="B"
                          phx-value-client_ltp= "<%= ltp %>"
                          phx-value-symbol= "<%= item.symbol %>"
                          phx-value-option_type="CE"
                          phx-value-expiry_date="<%= item.expiry_date%>"
                          phx-value-buy_sell_price="<%= buy_price_ce %>"
                          phx-value-buy_sell_strike_price ="<%= item.strike_price %>"
                          phx-value-buy_sell_instrument_name="OPTSTK"

                        >
                        <img src = "/images/buy.png" class="icon-img" />
                          <span class="tooltiptext">Buy (B)</span>
                        </button>
                    <span><%= buy_price_ce%></span>
                  </div>
                </td>
                <td class="td-border-color common-td">
                  <div class = "btn-sub-cont">
                      <button type="submit" style= "display:inline-block"
                        class="hide-button-oc tooltip other"
                        phx-click="buy_sell"
                        phx-value-select_ticker="<%= item.token_no %>"
                        phx-value-type="S"
                        phx-value-client_ltp= "<%= ltp %>"
                        phx-value-symbol= "<%= item.symbol %>"
                        phx-value-option_type="CE"
                        phx-value-expiry_date="<%= item.expiry_date%>"
                        phx-value-buy_sell_price="<%= sell_price_ce %>"
                        phx-value-buy_sell_strike_price ="<%= item.strike_price %>"
                        phx-value-buy_sell_instrument_name="OPTSTK"
                      >
                      <img src = "/images/sell.png" class="icon-img" />
                        <span class="tooltiptext">Sell (S)</span>
                      </button>
                      <span><%= sell_price_ce %></span>
                    </div>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.sell_volume_ce %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= strike_price %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= expiry_date %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.buy_volume_pe %></span>
                </td>
                <td class="td-border-color common-td">
                  <div class = "btn-sub-cont">
                        <button type="submit"
                        style= "display:inline-block"
                        class="hide-button-oc tooltip other"
                          phx-click="buy_sell"
                          phx-value-select_ticker="<%= item.token_no %>"
                          phx-value-type="B"
                          phx-value-client_ltp= "<%= ltp %>"
                          phx-value-symbol= "<%= item.symbol %>"
                          phx-value-option_type="PE"
                          phx-value-expiry_date="<%= item.expiry_date%>"
                          phx-value-buy_sell_price="<%= buy_price_pe %>"
                          phx-value-buy_sell_strike_price ="<%= item.strike_price %>"
                          phx-value-buy_sell_instrument_name="OPTSTK"
                        >
                        <img src = "/images/buy.png" class="icon-img" />

                          <span class="tooltiptext">Buy (B)</span>
                        </button>
                      <span><%= buy_price_pe %></span>
                  </div>
                </td>
                <td class="td-border-color common-td">
                  <div class = "btn-sub-cont">
                      <button type="submit" style= "display:inline-block"
                        class="hide-button-oc tooltip other"
                        phx-click="buy_sell"
                        phx-value-select_ticker="<%= item.token_no %>"
                        phx-value-type="S"
                        phx-value-client_ltp= "<%= ltp %>"
                        phx-value-symbol= "<%= item.symbol %>"
                        phx-value-option_type="PE"
                        phx-value-expiry_date="<%= item.expiry_date%>"
                        phx-value-buy_sell_price="<%= sell_price_pe %>"
                        phx-value-buy_sell_strike_price ="<%= item.strike_price %>"
                        phx-value-buy_sell_instrument_name="OPTSTK"
                      >
                      <img src = "/images/sell.png" class="icon-img" />
                      <span class="tooltiptext">Sell (S)</span>
                      </button>
                  <span><%= sell_price_pe %></span>
                  </div>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.sell_volume_pe %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.ltp_pe %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.total_volume_traded_pe %></span>
                </td>
                <td class="td-border-color common-td">
                  <span><%= item.open_interest_pe %></span>
                </td>
              </tr>
            </tbody>
            <%end%>
          <% end) %>
        </table>
      </div>
    <%end%>
    <%end%>

    </div>
    """
  end

  defp pad_zero(num) do
    if num < 10 do
        "0#{num}"
    else
        "#{num}"
    end
  end

  @impl true
  def handle_event("select-ticker-oc", %{"selected_ticker_oc" => selected_ticker_oc},socket) do
    IO.inspect(selected_ticker_oc,label: "selected_ticker_oc....")
    prev_selected_ticker = socket.assigns.selected_ticker_oc

    if prev_selected_ticker == nil do
      send(socket.root_pid, {:subscribe_oc,  %{
        selected_ticker: selected_ticker_oc
      }})
    else
      IO.inspect(prev_selected_ticker,label: "hello i'm here")
      if (prev_selected_ticker == "300000"  or prev_selected_ticker == "300001" or prev_selected_ticker == "300002") do

        send(self(), {:unsubscribe_ioc,  %{
          selected_ticker: prev_selected_ticker
        }})

        send(self(), {:subscribe_oc,  %{
        selected_ticker: selected_ticker_oc
        }})
      else
        send(self(), {:unsubscribe_oc,  %{
          selected_ticker: prev_selected_ticker
        }})

        send(self(), {:subscribe_oc,  %{
        selected_ticker: selected_ticker_oc
        }})
      end
    end
    socket = assign(socket,
        selected_ticker_oc: selected_ticker_oc
        )
    {:noreply, socket}
  end

  @impl true
  def handle_event("select-ticker-ioc", %{"selected_ticker_oc" => selected_ticker_oc},socket) do

    IO.inspect(selected_ticker_oc,label: "selected_ticker_oc....")
    prev_selected_ticker = socket.assigns.selected_ticker_oc

    if prev_selected_ticker == nil do
      send(socket.root_pid, {:subscribe_ioc,  %{
        selected_ticker: selected_ticker_oc
      }})
    else
      if (prev_selected_ticker == "300000"  or prev_selected_ticker == "300001" or prev_selected_ticker == "300002") do
        IO.inspect(prev_selected_ticker,label: "hello i'm here")
        send(self(), {:unsubscribe_ioc,  %{
          selected_ticker: prev_selected_ticker
        }})

        send(self(), {:subscribe_ioc,  %{
          selected_ticker: selected_ticker_oc
        }})
      else
        send(self(), {:unsubscribe_oc,  %{
          selected_ticker: prev_selected_ticker
        }})

        send(self(), {:subscribe_ioc,  %{
          selected_ticker: selected_ticker_oc
        }})
      end
    end
    socket =
        assign(socket,
        selected_ticker_oc: selected_ticker_oc
        )
    {:noreply, socket}
  end
end
